from src.aws.dynamodb import DynamoDB
from src.repositories.hello_repository import ProductsRepository
from src.use_cases.hello_service import CreateProductService


def bootstrap_di():
    dynamodb = DynamoDB(table="Products")

    repository = ProductsRepository(dynamoDB=dynamodb)
    service = CreateProductService(repository=repository)

    return service