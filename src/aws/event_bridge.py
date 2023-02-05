from datetime import datetime

import boto3


class EventBridge:
    def __init__(self):
        self.__aws_resource = None

    def get_resource(self):
        if not self.__aws_resource:
            self.__aws_resource = boto3.client('events')
        return self.__aws_resource

    def put_events(self):
        response = self.get_resource().put_events(
            Entries=[
                {
                    'Time': datetime(2015, 1, 1),
                    'Source': 'string',
                    'Resources': [
                        'string',
                    ],
                    'DetailType': 'string',
                    'Detail': 'string',
                    'EventBusName': 'checkout_events'
                },
            ]
        )
