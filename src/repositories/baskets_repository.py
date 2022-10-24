from src.aws.dynamodb import DynamoDB


class BasketsRepository:
    def __init__(self, dynamoDB: DynamoDB):
        self.__dynamoDB = dynamoDB

    def add_item(self, item):
        item = {'userName': item.get("username", None), 'name': item.get("name", None),
                'message': item}
        self.__dynamoDB.put_item(item)
