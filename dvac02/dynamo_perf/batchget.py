import boto3

dynamodb = boto3.resource('dynamodb')

customers_tbl = dynamodb.Table('Customers')
customer_recs_tbl = dynamodb.Table('CustomerRecords')

batch_keys = {
    customers_tbl.name: {
        'Keys': [
            {'customerId': 'p1', 'recordCreateDate': 's1'},
            {'customerId': 'p1', 'recordCreateDate': 's2'},
        ]
    },
    'CustomerRecords':  {
        'Keys': [
            {'customerId': 'p1', 'recordCreateDate': 's1'},
            {'customerId': 'p1', 'recordCreateDate': 's2'},
        ]
    }}


response = dynamodb.batch_get_item(RequestItems=batch_keys)
# for response_table, response_items in response.items():
#     print(f"Retrieved {len(response_items)} items from {response_table}")
print(response.items())
