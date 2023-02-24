import boto3
import json
import os
import time
from random import randint
import logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)
sqs_client = boto3.client('sqs')
queue_name_in = os.getenv('SQS_QUEUE_URL')


def send_message(queue_url: str, message: dict):
    message = json.dumps(message)
    response = sqs_client.send_message(
        QueueUrl=queue_url,
        MessageBody=message
    )
    logger.info(response)


while True:
    num = randint(1, 1000)
    send_message(queue_name_in, {'message': f'Hello World {str(num)}'})
    time.sleep(35)
