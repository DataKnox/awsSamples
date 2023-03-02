import boto3
from random import randint
from datetime import datetime
import names


def create_record():
    client = boto3.client('dynamodb')
    try:
        name = names.get_full_name()
        item_payload = {
            'customerId': {
                'S': f'cust-{str(randint(0, 1000000))}'
            },
            'recordCreateDate': {
                'S': f'{datetime.now().strftime("%Y-%m-%d %H:%M:%S")}'
            },
            'name': {
                'S': name
            }
        }
        client.put_item(
            TableName='CustomerRecords',
            Item=item_payload
        )
    except Exception as e:
        print(e)
        raise e
    return {'statusCode': 200}


create_record()
