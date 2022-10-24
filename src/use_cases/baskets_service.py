from src.repositories.baskets_repository import BasketsRepository


class CreateBasketService:
    def __init__(self, repository: BasketsRepository):
        self.__repository = repository

    def execute(self, request):
        self.__repository.add_item(request)
