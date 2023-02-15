import boto3
import json

sns_client = boto3.client('sns')
arn = 'arn:aws:sns:us-east-2:531517645343:firsttopic'


def publish_message(sns_topic_arn, message):
    response = sns_client.publish(
        TopicArn=sns_topic_arn,
        Message=json.dumps({'default': json.dumps(message)}),
        MessageStructure='json'
    )
    return response


publish_message(arn, {'message': 'Hello World'})
