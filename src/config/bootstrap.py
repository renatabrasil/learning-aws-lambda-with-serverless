import os

from src.aws.dynamodb import DynamoDB
from src.repositories.baskets_repository import BasketsRepository
from src.repositories.products_repository import ProductsRepository
from src.use_cases.baskets_service import CreateBasketService
from src.use_cases.products_service import CreateProductService

# def bootstrap_di():

#
# repository = ProductsRepository(dynamoDB=dynamodb)
# service = CreateProductService(repository=repository)
#
# return service


# bootstrap_di()

# Products
if os.environ.__contains__("DYNAMODB_PRODUCTS_TABLE"):
    products_db = DynamoDB(table=os.environ['DYNAMODB_PRODUCTS_TABLE'])
    products_repository = ProductsRepository(dynamoDB=products_db)
    products_service = CreateProductService(repository=products_repository)


# Baskets
if os.environ.__contains__("DYNAMODB_BASKETS_TABLE"):
    baskets_db = DynamoDB(table=os.environ['DYNAMODB_BASKETS_TABLE'])
    baskets_repository = BasketsRepository(dynamoDB=baskets_db)
    baskets_service = CreateBasketService(repository=baskets_repository)
