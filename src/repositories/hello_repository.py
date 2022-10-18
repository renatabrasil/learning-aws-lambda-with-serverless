from src.aws.dynamodb import DynamoDB


class ProductsRepository:
    def __init__(self, dynamoDB: DynamoDB):
        self.__dynamoDB = dynamoDB

    def add_item(self, item):
        self.__dynamoDB.put_item(item)