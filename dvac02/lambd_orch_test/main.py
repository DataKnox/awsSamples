import boto3
import logging
import json
import os

import smart_open
import requests

from botocore.exceptions import ClientError, ParamValidationError

demo_bucket = os.environ['S3_BUCKET']
demo_table = os.environ['DYNAMODB_TABLE']

dynamodb = boto3.resource('dynamodb')


def lambda_handler(event, context):
    data = download_file(
        'https://swapi.dev/api/people/')

    # Filter people who are from planet 1
    cast = [person for person in data['results']
            if person['homeworld'] == 'https://swapi.dev/api/planets/1/']

    for person in cast:
        dynamodb_put_item(demo_table,
                          {'name': person['name'], 'height': person['height'], 'birth_year': person['birth_year']})

    upload_file(json.dumps(data).encode('utf-8'))

    return {
        'statusCode': 200,
        'body': json.dumps('Success')
    }


def download_file(url):
    response = requests.get(url)
    if response.status_code != 200:
        raise Exception("Failed to download file, make sure it exists")
    return json.loads(response.content)


def upload_file(obj):
    with smart_open.open('s3://{}/{}'.format(demo_bucket, 'cast.json'), 'wb') as file:
        file.write(obj)


def dynamodb_put_item(table, item):
    try:
        table = dynamodb.Table(table)
        table.put_item(Item=item)
    except (ClientError, ParamValidationError) as e:
        logging.error(e)
        raise
