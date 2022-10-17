#resource "aws_api_gateway_rest_api" "MyDemoAPI" {
#  name        = "MyDemoAPI"
#  description = "This is my API for demonstration purposes"
#}
#
#
#resource "aws_api_gateway_resource" "MyDemoResource" {
#  rest_api_id = aws_api_gateway_rest_api.MyDemoAPI.id
#  parent_id   = aws_api_gateway_rest_api.MyDemoAPI.root_resource_id
#  path_part   = "products"
#}
#
#resource "aws_api_gateway_method" "MyDemoMethod" {
#  rest_api_id   = aws_api_gateway_rest_api.MyDemoAPI.id
#  resource_id   = aws_api_gateway_resource.MyDemoResource.id
#  http_method   = "GET"
#  authorization = "NONE"
#}
#
#
#resource "aws_api_gateway_integration" "integration" {
#  rest_api_id             = aws_api_gateway_rest_api.MyDemoAPI.id
#  resource_id             = aws_api_gateway_resource.MyDemoResource.id
#  http_method             = aws_api_gateway_method.MyDemoMethod.http_method
#  integration_http_method = "GET"
#  type                    = "AWS_PROXY"
#  uri                     = "arn:aws:apigateway:${var.my_region}:lambda:path/2015-03-31/functions/${var.lambda_arn}/invocations"
#}
#
## Lambda
#resource "aws_lambda_permission" "apigw_lambda" {
#  statement_id  = "AllowExecutionFromAPIGateway"
#  action        = "lambda:InvokeFunction"
#  function_name = var.lambda_name
#  principal     = "apigateway.amazonaws.com"
#
#  # More: http://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-control-access-using-iam-policies-to-invoke-api.html
#  source_arn = "arn:aws:execute-api:${var.my_region}:${var.accountId}:${aws_api_gateway_rest_api.MyDemoAPI.id}/*/${aws_api_gateway_method.MyDemoMethod.http_method}${aws_api_gateway_resource.MyDemoResource.path}"
#}
