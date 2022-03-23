import uuid

import boto3


class DynamoDB:
    def __init__(self, table: str):
        self.__aws_resource = None
        self.__table = table

    def get_table(self):
        if not self.__aws_resource:
            dynamo = boto3.resource('dynamodb')
            self.__aws_resource = dynamo.Table(self.__table)

        return self.__aws_resource

    def put_item(self, item):
        self.get_table().put_item(Item={'pk': str(uuid.uuid1()), 'sk': str(uuid.uuid4()), 'message': item})
