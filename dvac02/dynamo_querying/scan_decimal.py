import boto3
from boto3.dynamodb.conditions import Attr
import json
import decimal


class DecimalEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, decimal.Decimal):
            if o % 1 > 0:
                return float(o)
            else:
                return int(o)
        return super(DecimalEncoder, self).default(o)


def map_scan_dec():
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('CustomerRecords')
    fe = Attr('petDetails.petName').eq('Fido')
    response = table.scan(
        FilterExpression=fe
    )
    for r in response['Items']:
        # convert set favoriteColors to a list first - JSON does not support sets
        r['favoriteColors'] = list(r['favoriteColors'])
        # print output using the cls parameter to specify the DecimalEncoder class
        print(json.dumps(r, cls=DecimalEncoder, indent=2))


map_scan_dec()
