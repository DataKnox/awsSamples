import boto3
import json
import os, time
sqs_client = boto3.client('sqs')
queue_name_in = os.getenv('SQS_QUEUE_URL')


def send_message(queue_url: str, message: dict):
    while True:
        message = json.dumps(message)
        response = sqs_client.send_message(
            QueueUrl=queue_url,
            MessageBody=message
        )
        print(response)
        time.sleep(35)


send_message(queue_name_in, {'message': 'Hello World'})
