from redis import Redis
import boto3
import logging
import json
logger = logging.getLogger()
logger.setLevel(logging.INFO)
s3 = boto3.resource('s3')

redis = Redis(host='s3cacher.evntxa.ng.0001.use2.cache.amazonaws.com', port=6379,
              decode_responses=True, ssl=False, username='default', password='default')


def lambda_handler(event, context):
    bucket = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']
    size = event['Records'][0]['s3']['object']['size']
    logger.info(
        f"New object: {key} of size {size} bytes uploaded to {bucket}.")

    obj = s3.Object(bucket, key)
    data = obj.get()['Body'].read().decode('utf-8')
    logger.info(f"Contents: {data}")

    print("setting redis")
    redis.set(key, data)
    redis.expire(key, 60)
    logger.info(f"Data: {data}")
