import boto3
from datetime import datetime
import names
from random import randint


def perform_batch_write():
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('CustomerRecords')
    with table.batch_writer() as batch:
        for n in range(15):
            name = names.get_full_name()
            batch.put_item(
                Item={
                    'customerId': f'cust-{str(randint(0, 1000000))}',
                    'recordCreateDate': f'{datetime.now().strftime("%Y-%m-%d %H:%M:%S")}',
                    'name': name,
                    'age': str(randint(0, 100))
                }
            )


perform_batch_write()
