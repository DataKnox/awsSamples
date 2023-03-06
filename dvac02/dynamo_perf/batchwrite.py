import boto3
from datetime import datetime
import names
from random import randint


def perform_batch_write():
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('Customers')
    with table.batch_writer() as batch:
        for n in range(15):
            name = names.get_full_name()
            batch.put_item(
                Item={
                    'customerId': f'cust-{str(randint(0, 1000000))}',
                    'recordCreateDate': f'{datetime.now().strftime("%Y-%m-%d %H:%M:%S")}',
                    'name': name
                }
            )


def perform_dedupe_batch_write():
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('Customers')
    with table.batch_writer(overwrite_by_pkeys=['customerId', 'recordCreateDate']) as batch:
        for n in range(15):
            name = names.get_full_name()
            batch.put_item(
                Item={
                    'customerId': 'p1',
                    'recordCreateDate': 's1',
                    'other': '111',
                }
            )
            batch.put_item(
                Item={
                    'customerId': 'p1',
                    'recordCreateDate': 's1',
                    'other': '222',
                }
            )
            batch.put_item(
                Key={
                    'customerId': 'p1',
                    'recordCreateDate': 's2'
                }
            )
            batch.put_item(
                Item={
                    'customerId': 'p1',
                    'recordCreateDate': 's2',
                    'other': '444',
                }
            )


def perform_batch_write_with_condition():
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('Customers')
    with table.batch_writer() as batch:
        for n in range(15):
            name = names.get_full_name()
            batch.put_item(
                Item={
                    'customerId': f'cust-{str(randint(0, 1000000))}',
                    'recordCreateDate': f'{datetime.now().strftime("%Y-%m-%d %H:%M:%S")}',
                    'name': name
                },
                # https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.ConditionExpressions.html
                # attribute_exists | attribute_not_exists | attribute_type | contains | begins_with | size
                ConditionExpression='attribute_not_exists(customerId)'
            )


perform_batch_write()