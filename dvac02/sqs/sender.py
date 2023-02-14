import boto3
import json

sqs_client = boto3.client('sqs')
queue_name_in = 'firstqueue'


def send_message(queue_name: str, message: dict):
    message = json.dumps(message)
    queue_url = sqs_client.get_queue_url(QueueName=queue_name)['QueueUrl']
    response = sqs_client.send_message(
        QueueUrl=queue_url,
        MessageBody=message
    )
    print(response)


send_message(queue_name_in, {'message': 'Hello World'})
