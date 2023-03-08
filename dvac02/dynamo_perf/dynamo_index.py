import boto3
from boto3.dynamodb.conditions import Key
import time


def secondary_query():
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('DynamoTable')
    # When adding a global secondary index to an existing table, you cannot query the index until it has been backfilled.
    # This portion of the script waits until the index is in the “ACTIVE” status, indicating it is ready to be queried.
    while True:
        if not table.global_secondary_indexes or table.global_secondary_indexes[0]['IndexStatus'] != 'ACTIVE':
            print('Waiting for index to backfill...')
            time.sleep(5)
            table.reload()
        else:
            break
    local_resp = table.query(
        # Add the name of the index you want to use in your query.
        IndexName="age-index",
        KeyConditionExpression=Key('customerId').eq(
            'cust-421225') & Key('age').eq('58')
    )

    print("The local index query returned the following items:")
    for item in local_resp['Items']:
        print(item)

    global_resp = table.query(
        # Add the name of the index you want to use in your query.
        IndexName="name-age-index",
        KeyConditionExpression=Key('name').eq(
            'Martha Russo') & Key('age').eq('28')
    )
    print("The global index query returned the following items:")
    for item in global_resp['Items']:
        print(item)


secondary_query()
