import boto3


def get_data():
    # get a specific record by providing the primary key
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('CustomerRecords')
    response = table.get_item(
        Key={
            'customerId': 'cust-616660',
            'recordCreateDate': '2023-03-02 10:41:53'
        }
    )
    print(response['Item'])
    return response['Item']


get_data()
