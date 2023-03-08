from redis import Redis
import logging

logging.basicConfig(level=logging.INFO)
redis = Redis(host='cachetest.evntxa.ng.0001.use2.cache.amazonaws.com', port=6379,
              decode_responses=True, ssl=False, username='default', password='default')

if redis.ping():
    logging.info("Connected to Redis")
