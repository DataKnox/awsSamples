import os
import boto3


def lambda_handler(event, context):
    ddb = boto3.client('dynamodb')
    ddb.delete_item(
        TableName=os.environ['table'],
        Key={
            'connectionId': {
                'S': event['requestContext']['connectionId']
            }
        }
    )
    return {'statusCode': 200}
