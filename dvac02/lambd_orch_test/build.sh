#!/bin/bash

set -e

function cleanup {
  echo "Cleaning up..."
  rm -rf .pytest_cache __pycache__ *.pyc
}

ENV=$1
SCRIPT_NAME=$(yq -r .Resources.LambdaFunction.Properties.Handler template.yaml | awk -F'.' '{print $1}')
FUNCTION_NAME=$(yq -r .Parameters.LambdaName.Default template.yaml) 
STACK_NAME=$FUNCTION_NAME-$ENV


# Set an S3 bucket for storing the uploaded zip artifact. 
# Make sure the buckets are created before running the script.
case $ENV in
    dev)
        LAMBDA_ARTIFACT_BUCKET=swapi-dev-buck
        ;;
    staging)
        LAMBDA_ARTIFACT_BUCKET=swapi-lambda-staging
        ;;
    prod)
        LAMBDA_ARTIFACT_BUCKET=swapi-lambda-prod
        ;;
    *)
        echo "Environment should be dev/staging/prod only"
        exit 1
esac


# Syntax check
python3 -m py_compile $SCRIPT_NAME.py

# Unit tests
pytest --cov-report term-missing --cov=. test.py -rxXs

# Prepare
mkdir -p dist/
rsync -av --exclude-from 'excludes.txt' "$PWD/" dist/

# Clean garbage
trap cleanup EXIT

# Build
sam build --build-dir build --use-container  

# Skip integration tests on the first run because the resources are not created yet
exists=$(aws cloudformation describe-stacks --stack-name $STACK_NAME | jq .[][].StackName)
if [[ ! -z "$exists" ]]
then
        sam local invoke --template build/template.yaml --env-vars ${ENV}.json --event ${FUNCTION_NAME}-event.json > output
        cat output
        status=$(cat output | jq .statusCode)
        if [[ -z "$status" ]]
        then
            echo "integration test failed: lambda did not finish properly"
            exit 1
        elif [[ "$status" != 200 ]]
        then
            echo "integration test failed with the following error code: $status"
            exit 1
        fi
else
        echo "skipping integration test on the first run. The error is ok."
fi

# Package
sam package --metadata function=$FUNCTION_NAME --s3-prefix $FUNCTION_NAME  --template-file build/template.yaml --s3-bucket $LAMBDA_ARTIFACT_BUCKET --output-template-file build/packaged.yaml

# Deploy
sam deploy --template-file build/packaged.yaml --stack-name "$STACK_NAME" --capabilities CAPABILITY_IAM --parameter-overrides "ParameterKey=Environment,ParameterValue=${ENV}"

exit 0
