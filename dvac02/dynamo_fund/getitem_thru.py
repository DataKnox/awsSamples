import boto3
import json


def get_data():
    # check consumed capacity when swapping consistent read for eventual
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('CustomerRecords')
    response = table.get_item(
        Key={
            'customerId': 'cust-616660',
            'recordCreateDate': '2023-03-02 10:41:53'
        },
        ReturnConsumedCapacity='TOTAL',
        ConsistentRead=True
    )
    print(json.dumps(response, indent=2))
    return response['Item']


get_data()
