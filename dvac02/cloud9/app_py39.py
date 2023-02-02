import json


def lambda_handler(event, context):
    if event['type'] == 'planet':
        if event['detail'] == 'tatooine':
            body = "Hello Tatooine!"
        elif event['detail'] == 'alderaan':
            body = "Hello Alderaan!"
        elif event['detail'] == 'hoth':
            body = "Hello Hoth!"
        else:
            body = "Hello Unknown Planet!"
    elif event['type'] == 'starship':
        if event['detail'] == 'falcon':
            body = "Hello Millennium Falcon!"
        elif event['detail'] == 'enterprise':
            body = "Hello USS Enterprise!"
        else:
            body = "Hello Unknown Starship!"

    response = {
        "statusCode": 200,
        "body": json.dumps(body)
    }

    return response
