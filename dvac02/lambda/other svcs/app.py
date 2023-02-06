import logging
import boto3
from aws_lambda_typing import context as context_
logger = logging.getLogger()
logger.setLevel(logging.INFO)
client = boto3.client('dynamodb')


def handler(event: dict, context: context_.Context) -> dict:
    data = client.put_item(
        TableName='firstdemotbl',
        Item={
            'id': {
                'Str': event['id']
            },
            'price': {
                'Num': f"{str(event['price'])}"
            },
            'name': {
                'Str': event['name']
            }
        }
    )
    logger.info(f"data: {data}")
    response = {
        'statusCode': 200,
        'body': 'PUT operation successful',
        'headers': {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*'
        },
    }

    return response
