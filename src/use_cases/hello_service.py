from src.repositories.hello_repository import HelloRepository


class HelloService:
    def __init__(self, repository: HelloRepository):
        self.__repository = repository

    def execute(self, request):
        self.__repository.add_item(request)
