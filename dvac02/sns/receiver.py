import boto3
import json
import logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)
sqs_client = boto3.client('sqs')
queue_name_in = 'sub1'


def receive_messages(queue_name: str):
    queue_url = sqs_client.get_queue_url(QueueName=queue_name)['QueueUrl']
    try:
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
    except Exception as error:
        logger.exception(
            "Couldn't receive messages from queue: %s", queue_name)
        raise error
    else:
        return messages


receive_messages(queue_name_in)
