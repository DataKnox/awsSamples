from boto3.dynamodb.conditions import Key
import boto3
import json


def scan_records():
    # scans whole table looking for a specific name
    fe = Key('name').eq('Cheryl Mejia')
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('CustomerRecords')
    response = table.scan(FilterExpression=fe)
    print(response['Items'])
    return response['Items']


scan_records()
