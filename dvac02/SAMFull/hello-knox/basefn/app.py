import json
import boto3
from datetime import datetime

now: datetime = datetime.now()

s3 = boto3.client('s3')


def lambda_handler(event, context) -> dict:
    date_time: str = now.strftime("%m-%d-%Y-%H-%M-%S")
    object: dict = {
        'Bucket': 'samdeploymentforknox',
        'Body': f'fn called at {date_time}',
        'Key': f'fn_called_{date_time}.txt'
    }
    s3.put_object(**object)

    return {
        "statusCode": 200,
        "body": json.dumps({
            "message": "hello world",
            "time": now.strftime("%H:%M:%S")
        }),
    }
