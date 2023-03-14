import boto3
from redis import Redis
redis = Redis(host='cache-app.evntxa.ng.0001.use2.cache.amazonaws.com', port=6379,
              decode_responses=True, ssl=False, username='default', password='default')
s3 = boto3.resource('s3')


def get_object(bucket, key):
    try:
        datas = redis.get(key)
        if datas is None:
            print("cache miss")
            obj = s3.Object(bucket, key)
            data = obj.get()['Body'].read().decode('utf-8')
            redis.set(key, data)
            redis.expire(key, 60)
        else:
            print("cache hit")
            print("Data retrieved from redis = " + datas)
    except Exception as e:
        print(e)
        return None


if __name__ == "__main__":
    get_object('knox-def-bucket', 'customers-2023-03-14-12-49-17.txt')
