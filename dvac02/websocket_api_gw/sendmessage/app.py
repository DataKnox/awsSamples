import boto3
import json
import os
ddb = boto3.client('dynamodb')


def lambda_handler(event, context):
    connections = None
    try:
        connections = ddb.scan(TableName=os.environ.get('table'))['Items']
    except Exception as e:
        print(e)
        return {
            'statusCode': 500,
            'body': json.dumps('Error getting connections')
        }
    client = boto3.client('apigatewaymanagementapi',
                          endpoint_url='https://'+event['requestContext']['domainName'] + '/' + event['requestContext']['stage'])
    message = json.loads(event['body'])['message']
    for connection in connections:
        try:
            client.post_to_connection(
                ConnectionId=connection['connectionId']['S'],
                Data=json.dumps(message)
            )
        except Exception as e:
            print(e)
            return {
                'statusCode': 500,
                'body': json.dumps('Error sending message')
            }
    return {
        'statusCode': 200,
        'body': json.dumps('Message sent')
    }
