import logging
import json

logger = logging.getLogger()
logger.setLevel(logging.INFO)


def handler(event, context):
    logging.info(f"event: {event}")
    payload = json.loads(event['body'])
    upper = payload['INPUT'].upper()
    return {
        "statusCode": 200,
        "body": json.dumps({
            "message": upper
        }),
    }
