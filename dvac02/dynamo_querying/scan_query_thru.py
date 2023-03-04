import boto3
from boto3.dynamodb.conditions import Key, Attr


def scan_records_for_atts_reserved_sort():
    # https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html
    fe = Key('name').eq('Cheryl Mejia') & Key(
        'recordCreateDate').gt('2023-03-02 10:41:53')
    pe = "#n, recordCreateDate"
    exp_att_names = {"#n": "name"}
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('CustomerRecords')
    response = table.scan(
        FilterExpression=fe,
        ProjectionExpression=pe,
        ExpressionAttributeNames=exp_att_names,
        ReturnConsumedCapacity='TOTAL'
    )
    print("Scan Records for Attributes w reserved keywords Composite:")
    print("\tResult:")
    print(response)
    return response['Items']


def query_records_for_atts_reserved_sort():
    # https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html
    fe = Key('customerId').eq('cust-616660') & Key(
        'recordCreateDate').gt('2023-03-02 10:41:53')
    pe = "#n, recordCreateDate"
    exp_att_names = {"#n": "name"}
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('CustomerRecords')
    response = table.query(
        KeyConditionExpression=fe,
        ProjectionExpression=pe,
        ExpressionAttributeNames=exp_att_names,
        ReturnConsumedCapacity='TOTAL'
    )
    print("Query Records for Attributes w reserved keywords Composite:")
    print("\tResult:")
    print(response)
    return response['Items']


scan_records_for_atts_reserved_sort()
query_records_for_atts_reserved_sort()
