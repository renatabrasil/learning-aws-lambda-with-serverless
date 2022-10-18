from src.repositories.hello_repository import ProductsRepository


class CreateProductService:
    def __init__(self, repository: ProductsRepository):
        self.__repository = repository

    def execute(self, request):
        self.__repository.add_item(request)
