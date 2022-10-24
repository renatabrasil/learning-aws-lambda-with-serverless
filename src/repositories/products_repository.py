import uuid

from src.aws.dynamodb import DynamoDB


class ProductsRepository:
    def __init__(self, dynamoDB: DynamoDB):
        self.__dynamoDB = dynamoDB

    def add_item(self, item):
        item = {'id': str(uuid.uuid1()), 'name': item.get("name", None), 'unit_price': item.get("unit_price", None),
                'message': item}
        self.__dynamoDB.put_item(item)
