import json


def hello_world(event, context):
    event_body = json.loads(event['body'])
    if event_body['type'] == 'planet':
        match event_body['detail']:
            case "tatooine":
                body = "Hello Tatooine!"
            case "dagobah":
                body = "Hello Dagobah!"
            case _:
                body = "Hello World!"
    elif event_body['type'] == 'starship':
        match event_body['detail']:
            case "enterprise":
                body = "Hello Enterprise!"
            case "defiant":
                body = "Hello Defiant!"
            case _:
                body = "Hello World!"

    response = {
        "statusCode": 200,
        "body": json.dumps(body)
    }

    return response
