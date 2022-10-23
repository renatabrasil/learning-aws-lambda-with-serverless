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

    def put_item(self, item: dict):
        print("Putting item on table")
        self.get_table().put_item(Item={'id': str(uuid.uuid1()), 'name': item.get("name", None), 'message': item})
        print("Done putting item on table")
