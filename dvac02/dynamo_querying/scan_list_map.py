import boto3
from boto3.dynamodb.conditions import Attr


def list_scan():
    # contains only works with lists and sets
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('CustomerRecords')
    fe = Attr('favoriteColors').contains('blue')
    response = table.scan(
        FilterExpression=fe
    )
    print("List results")
    print(response)


def map_scan():
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('CustomerRecords')
    fe = Attr('petDetails.petName').eq('Fido')
    response = table.scan(
        FilterExpression=fe
    )
    print("Map results")
    print(response)


list_scan()
map_scan()
