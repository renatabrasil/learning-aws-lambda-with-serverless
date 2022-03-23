from src.aws.dynamodb import DynamoDB
from src.repositories.hello_repository import HelloRepository
from src.use_cases.hello_service import HelloService


def bootstrap_di():
    dynamodb = DynamoDB(table="HelloRegistry")

    repository = HelloRepository(dynamoDB=dynamodb)
    service = HelloService(repository=repository)

    return service