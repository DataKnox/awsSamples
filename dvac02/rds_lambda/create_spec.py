import boto3
from datetime import datetime


def create_record():
    client = boto3.client('dynamodb')
    try:
        client.put_item(
            TableName='customerdata',
            Item={
                'customerid': {'N': '7615'},
                'recordCreateDate': {'S': f'{datetime.now().strftime("%Y-%m-%d %H:%M:%S")}'},
                'name': {'S': 'Melba Smith'},
                'favoriteColors': {'SS': ['red', 'green', 'blue']},
                'petDetails': {'M': {
                    'petName': {'S': 'Fido'},
                    'petType': {'S': 'dog'},
                    'petAge': {'N': '3'}
                }}
            }
        )
    except Exception as e:
        print(e)
        raise e
    return {'statusCode': 200}


create_record()
