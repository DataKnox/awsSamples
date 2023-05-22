import logging
import json
from aws_lambda_typing import context as context_, events

logger = logging.getLogger()
logger.setLevel(logging.INFO)


def lambda_handler(event: dict, context: context_.Context) -> dict:
    logger.info(f"Event: {event}")
    return {"statusCode": 200, "body": json.dumps({"message": "Hello World"})}
