#module "apigateway-v2" {
#  source  = "terraform-aws-modules/apigateway-v2/aws"
#  version = "2.2.0"
#
#
#  name          = "apigateway-v2"
#  description   = "My awesome HTTP API Gateway"
#  protocol_type = "HTTP"
#
#  cors_configuration = {
#    allow_headers = [
#      "content-type", "x-amz-date", "authorization", "x-api-key", "x-amz-security-token", "x-amz-user-agent"
#    ]
#    allow_methods = ["*"]
#    allow_origins = ["*"]
#  }
#
#  integrations = {
#    "GET /products" = {
#      lambda_arn             = var.lambda_arn
#      payload_format_version = "2.0"
#      timeout_milliseconds   = 12000
#      # Should comply with the resource server configuration part of the cognito user pool
#    }
#  }
#
#
#  tags = {
#    Name = "dev-api-new"
#  }
#
#}
#
#
#resource "aws_api_gateway_stage" "example" {
#  deployment_id = module.apigateway-v2.id
#  rest_api_id   = aws_api_gateway_rest_api.example.id
#  stage_name    = "example"
#}


resource "aws_api_gateway_rest_api" "MyDemoAPI" {
  name        = "MyDemoAPI"
  description = "This is my API for demonstration purposes"
}


resource "aws_api_gateway_resource" "MyDemoResource" {
  rest_api_id = aws_api_gateway_rest_api.MyDemoAPI.id
  parent_id   = aws_api_gateway_rest_api.MyDemoAPI.root_resource_id
  path_part   = "products"
}

resource "aws_api_gateway_method" "MyDemoMethod" {
  rest_api_id   = aws_api_gateway_rest_api.MyDemoAPI.id
  resource_id   = aws_api_gateway_resource.MyDemoResource.id
  http_method   = "GET"
  authorization = "NONE"
}


resource "aws_api_gateway_integration" "integration" {
  rest_api_id             = aws_api_gateway_rest_api.MyDemoAPI.id
  resource_id             = aws_api_gateway_resource.MyDemoResource.id
  http_method             = aws_api_gateway_method.MyDemoMethod.http_method
  integration_http_method = "GET"
  type                    = "AWS_PROXY"
  uri                     = "arn:aws:apigateway:${var.my_region}:lambda:path/2015-03-31/functions/${var.lambda_arn}/invocations"
}

# Lambda
resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_name
  principal     = "apigateway.amazonaws.com"

  # More: http://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-control-access-using-iam-policies-to-invoke-api.html
  source_arn = "arn:aws:execute-api:${var.my_region}:${var.accountId}:${aws_api_gateway_rest_api.MyDemoAPI.id}/*/${aws_api_gateway_method.MyDemoMethod.http_method}${aws_api_gateway_resource.MyDemoResource.path}"
}