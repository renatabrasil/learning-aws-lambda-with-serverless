import json

from src.config.bootstrap import bootstrap_di


def hello(event, context):
    print(event)

    service = bootstrap_di()

    response = {
        "statusCode": 200,
    }

    return response

    # Use this code if you don't use the http event with the LAMBDA-PROXY
    # integration
    """
    return {
        "message": "Go Serverless v1.0! Your function executed successfully!",
        "event": event
    }
    """
