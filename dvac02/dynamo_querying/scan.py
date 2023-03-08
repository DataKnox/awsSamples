import boto3
import json


def scan_records():
    # scans whole table
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('CustomerRecords')
    response = table.scan()
    print(response)
    return response['Items']


scan_records()
