from redis import Redis
import boto3
import json
redis = Redis(host='cachetest.evntxa.ng.0001.use2.cache.amazonaws.com', port=6379,
              decode_responses=True, ssl=False, username='default', password='default')


def get_datas():
    try:
        datas = redis.get('cust-941540')
        if datas is None:
            print("redis is empty")
            print("querying dynamodb")
            dynamodb = boto3.client('dynamodb')

            response = dynamodb.query(
                TableName='CustomerRecords',
                KeyConditionExpression='customerId = :customerId',
                ExpressionAttributeValues={
                    ':customerId': {'S': 'cust-941540'}
                },
                ReturnConsumedCapacity='TOTAL'
            )
            datas = response['Items'][0]

            print("serializing dict to json and byte string")
            dict_str = json.dumps(datas)
            dict_bytes = bytes(dict_str, 'utf-8')

            print("setting redis")
            redis.set('cust-941540', dict_bytes)
        else:
            print("redis is not empty")

            my_dict = json.loads(datas)
            print(my_dict)
        return datas
    except Exception as e:
        print(e)
        return None


get_datas()
