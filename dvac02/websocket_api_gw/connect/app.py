import boto3
import os


def lambda_handler(event, context):
    client = boto3.client('dynamodb')
    try:
        client.put_item(
            TableName=os.environ['table'],
            Item={
                'connectionId': {'S': event['requestContext']['connectionId']}
            }
        )
    except Exception as e:
        print(e)
        raise e
    return {'statusCode': 200}
