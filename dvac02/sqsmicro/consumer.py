import boto3
import json
import logging
import time
import os
logger = logging.getLogger()
logger.setLevel(logging.INFO)
sqs_client = boto3.client('sqs')
queue_name_in = os.getenv('SQS_QUEUE_URL')


def receive_messages(queue_url: str):
    messages = sqs_client.receive_message(
        QueueUrl=queue_url,
        AttributeNames=[
            'SentTimestamp'
        ],
        MaxNumberOfMessages=3,
        MessageAttributeNames=[
            'All'
        ],
        VisibilityTimeout=0,
        WaitTimeSeconds=0
    )
    print(messages)
    for msg in messages['Messages']:
        receipt_handle = msg['ReceiptHandle']
        logger.info(f"message found: \n {msg['Body']}")
        # Delete received message from queue
        sqs_client.delete_message(
            QueueUrl=queue_url,
            ReceiptHandle=receipt_handle
        )
        logger.info('Received and deleted message: %s' % msg)


while True:
    receive_messages(queue_name_in)
    time.sleep(30)
