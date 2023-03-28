import json
import mock
import os
import pytest
import responses

from moto import mock_dynamodb


# Override smart_open library as it doesn't have any mock implementation
with mock.patch.dict(os.environ, {"S3_BUCKET": "test-bucket"}),\
        mock.patch.dict(os.environ, {"DYNAMODB_TABLE": "test1"}),\
        mock.patch.dict('sys.modules', smart_open=mock.MagicMock()):
    from main import *


# Apply responses decorator
@responses.activate
def test_download_file():
    test_cases = [
        {
            "name": "works properly",
            "url": "https://swapi.dev/api/people",
            "status_code": 200,
            "output": {
                "name": "Luke Skywalker",
                        "height": "172",
                        "mass": "77",
                        "hair_color": "blond",
                        "skin_color": "fair",
                        "eye_color": "blue",
                        "birth_year": "19BBY",
                        "gender": "male",
                        "homeworld": "https://swapi.dev/api/planets/1/",
                        "films": [
                                "https://swapi.dev/api/films/1/",
                                "https://swapi.dev/api/films/2/",
                                "https://swapi.dev/api/films/3/",
                                "https://swapi.dev/api/films/6/"
                        ],
                "species": [],
                "vehicles": [
                            "https://swapi.dev/api/vehicles/14/",
                            "https://swapi.dev/api/vehicles/30/"
                        ],
                "starships": [
                            "https://swapi.dev/api/starships/12/",
                            "https://swapi.dev/api/starships/22/"
                        ],
                "created": "2014-12-09T13:50:51.644000Z",
                "edited": "2014-12-20T21:17:56.891000Z",
                "url": "https://swapi.dev/api/people/1/"
            }
        },
        {
            "name": "error!",
            "url": "http://bad.url.com",
            "status_code": 404,
            "output": {'error': 'not found'}
        }
    ]

    for test in test_cases:
        responses.add(responses.GET, test['url'],
                      json=test['output'], status=test['status_code'])

        if test['name'] == 'error!':
            with pytest.raises(Exception):
                result = download_file(test['url'])
        else:
            result = download_file(test['url'])
            assert result == test['output']


@mock_dynamodb
def test_dynamodb_put_item():
    table_name = "swapi-table"
    conn = boto3.client(
        "dynamodb",
        region_name="us-east-2"
    )

    # conn.create_table(
    #     TableName=table_name,
    #     KeySchema=[{"AttributeName": "name", "KeyType": "HASH"}],
    #     AttributeDefinitions=[{"AttributeName": "name", "AttributeType": "S"}],
    #     ProvisionedThroughput={
    #         "ReadCapacityUnits": 5, "WriteCapacityUnits": 5},
    # )

    dynamodb_put_item(
        table_name, {'name': 'Luke Skywalker', 'height': '175', 'birth_year': '19BBY'})
    with pytest.raises(ClientError):
        dynamodb_put_item(
            "swap-table", {'name': 'Luke Skywalker', 'height': '175', 'birth_year': '19BBY'})

    with pytest.raises(ParamValidationError):
        dynamodb_put_item(table_name, "intended type mismatch")


def test_upload_file():
    obj = json.dumps('{"something": "something"}')
    upload_file(obj)
