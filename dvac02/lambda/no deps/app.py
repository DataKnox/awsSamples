import logging
import json


logger = logging.getLogger()
logger.setLevel(logging.INFO)


def lambda_handler(event: dict, context) -> dict:
    logger.info(f"Event: {event}")
    return {"statusCode": 200, "body": json.dumps({"message": "Hello World"})}
