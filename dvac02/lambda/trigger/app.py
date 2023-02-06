import json
import urllib.parse
import boto3
import logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)


s3 = boto3.client('s3')


def lambda_handler(event, context):
    logger.info("S3 event: " + json.dumps(event, indent=2))

    bucket = event['Records'][0]['s3']['bucket']['name']
    key = urllib.parse.unquote_plus(
        event['Records'][0]['s3']['object']['key'], encoding='utf-8')
    try:
        response = s3.get_object(Bucket=bucket, Key=key)
        logger.info(f"full s3 response: {response}")
        return response['ContentType']
    except Exception as err:
        logger.info(err)
        logger.info(
            f'Could not retrieve {key} from bucket {bucket}. Verify your trigger is accurately configured.')
        raise err
