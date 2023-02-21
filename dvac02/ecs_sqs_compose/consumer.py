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
    while True:
        messages = sqs_client.receive_message(
            QueueUrl=queue_url,
            AttributeNames=[
                'SentTimestamp'
            ],
            MaxNumberOfMessages=1,
            MessageAttributeNames=[
                'All'
            ],
            VisibilityTimeout=0,
            WaitTimeSeconds=0
        )
        # print(f"messages: {messages['Messages']}")
        for msg in messages['Messages']:
            receipt_handle = msg['ReceiptHandle']
            print(f"message found: \n {msg['Body']}")
            # Delete received message from queue
            sqs_client.delete_message(
                QueueUrl=queue_url,
                ReceiptHandle=receipt_handle
            )
            print('Received and deleted message: %s' % msg)
        time.sleep(30)


receive_messages(queue_name_in)
