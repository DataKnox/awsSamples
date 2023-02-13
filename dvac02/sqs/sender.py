import boto3
import json

sqs_client = boto3.resource('sqs')
queue_name = 'dvac02'


def send_message(queue_name, message):
    message = {"key": "value"}
    response = sqs_client.send_message(
        QueueUrl="https://us-west-2.queue.amazonaws.com/xxx/my-new-queue",
        MessageBody=json.dumps(message)
    )
    print(response)
