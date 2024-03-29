import json
from decimal import Decimal

from src.config.bootstrap import products_service, baskets_service
from src.utils.utils import Encoder

products = [
    {
        "id": "4e9257d5-0b3f-4246-8420-979661e650a5",
        "name": "Bola",
        "quantity": 4,
        "unit_price": "13.67"
    },
    {
        "id": "3524eafb-cd0e-485b-bd08-ccb93cf25d8e",
        "name": "Raquete de tenis",
        "quantity": 5,
        "unit_price": "44.67"
    },
    {
        "id": "44574583-789b-400f-ad0d-146df7ec8897",
        "name": "Bola de tenis",
        "quantity": 48,
        "unit_price": "100.34"
    }, {
        "id": "a320efda-11d2-4e20-86d8-02eff30ec074",
        "name": "Rede de Volei",
        "quantity": 11,
        "unit_price": "65.40"
    }
]


def create_product(event, context):
    # bootstrap_products_di()

    print(f"criar produto = {event}")
    product = json.loads(event.get("body", None), parse_float=Decimal)

    products.append(product)
    products_service.execute(product)

    return format_response(status=201)


def checkout_basket(event, context):
    # bootstrap_baskets_di()

    print(f"event checkout comming = {event}")
    basket = json.loads(event.get("body", None), parse_float=Decimal)

    baskets_service.execute(basket)

    return format_response(status=203)


def hello(event, context):
    print(f"listar produtos = {event}")

    response = format_response(status=200, message=products)

    return response


def format_response(status: int, message: str = ""):
    response = {
        "statusCode": status,
        "headers": {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Credentials': True,
        },
        "body": json.dumps(message, cls=Encoder),
    }
    return response
