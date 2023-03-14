from redis import Redis
import boto3
import json
import names
from random import randint
from datetime import datetime
redis = Redis(host='cachetest.evntxa.ng.0001.use2.cache.amazonaws.com', port=6379,
              decode_responses=True, ssl=False, username='default', password='default')


def get_datas(cust=None):
    try:
        datas = redis.get(cust)
        if datas is None:
            print("redis is empty")
            print("querying dynamodb")
            dynamodb = boto3.client('dynamodb')

            response = dynamodb.query(
                TableName='CustomerRecords',
                KeyConditionExpression='customerId = :customerId',
                ExpressionAttributeValues={
                    ':customerId': {'S': cust}
                },
                ReturnConsumedCapacity='TOTAL'
            )
            datas = response['Items'][0]

            print("serializing dict to json and byte string")
            dict_str = json.dumps(datas)
            dict_bytes = bytes(dict_str, 'utf-8')

            print("setting redis")
            redis.set(cust, dict_bytes)
        else:
            print("redis is not empty")

            my_dict = json.loads(datas)
            print(my_dict)
        return datas
    except Exception as e:
        print(e)
        return None


def set_datas():
    client = boto3.client('dynamodb')
    try:
        name = names.get_full_name()
        cust_id = f'cust-{str(randint(0, 1000000))}'
        item_payload = {
            'customerId': {
                'S': cust_id
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
        print(f"Customer ID is {cust_id}")
        dict_str = json.dumps(item_payload)
        dict_bytes = bytes(dict_str, 'utf-8')
        redis.set(cust_id, dict_bytes)
        redis.expire(cust_id, 6000)
    except Exception as e:
        print(e)
        raise e
    return {'statusCode': 200}


# get_datas('cust-685378')
set_datas()
