import json


def hello_world(event, context):
    event_body = json.loads(event['body'])
    if event_body['type'] == 'planet':
        if event_body['detail'] == 'tatooine':
            body = "Hello Tatooine!"
        elif event_body['detail'] == 'alderaan':
            body = "Hello Alderaan!"
        elif event_body['detail'] == 'hoth':
            body = "Hello Hoth!"
        else:
            body = "Hello Unknown Planet!"
    elif event_body['type'] == 'starship':
        if event_body['detail'] == 'falcon':
            body = "Hello Millennium Falcon!"
        elif event_body['detail'] == 'enterprise':
            body = "Hello USS Enterprise!"
        else:
            body = "Hello Unknown Starship!"

    response = {
        "statusCode": 200,
        "body": json.dumps(body)
    }

    return response
