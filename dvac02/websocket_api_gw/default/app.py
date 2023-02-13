import boto3
import json


def lambda_handler(event, context):
    client = boto3.client('apigatewaymanagementapi',
                          endpoint_url='https://'+event['requestContext']['domainName'] + '/' + event['requestContext']['stage'])
    connection_id = event['requestContext']['connectionId']
    try:
        connection_info = client.get_connection(
            ConnectionId=connection_id
        )
    except Exception as e:
        print(e)
        raise e
    connection_info['connectionId'] = connection_id
    client.post_to_connection(
        Data=f'Your info: {json.dumps(connection_info, default=str)}',
        ConnectionId=connection_id
    )
    return {'statusCode': 200}
