import boto3


def update():
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('CustomerRecords')
    response = table.update_item(
        Key={
            'customerId': 'cust-616660',
            'recordCreateDate': '2023-03-02 10:41:53'
        },
        UpdateExpression='SET age = :val1',
        ExpressionAttributeValues={
            ':val1': 25
        },
        ReturnValues='UPDATED_NEW'
    )
    print(response)


def batch_delete():
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('CustomerRecords')
    with table.batch_writer() as batch:
        batch.delete_item(
            Key={
                'customerId': 'cust-616660',
                'recordCreateDate': '2023-03-02 10:43:25'
            }
        )
        batch.delete_item(
            Key={
                'customerId': 'cust-616660',
                'recordCreateDate': '2023-03-02 10:44:10'
            }
        )


update()
