import json
import boto3
# import requests

s3 = boto3.client('s3')


def lambda_handler(event, context) -> dict:
    object: dict = {
        'Bucket': 'samdeploymentforknox',
        'Body': 'fn called',
        'Key': 'fn_called.txt'
    }
    s3.put_object(**object)

    return {
        "statusCode": 200,
        "body": json.dumps({
            "message": "hello world",
            # "location": ip.text.replace("\n", "")
        }),
    }
