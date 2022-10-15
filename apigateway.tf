module "apigateway-v2" {
  source  = "terraform-aws-modules/apigateway-v2/aws"
  version = "2.2.0"


  name          = "apigateway-v2"
  description   = "My awesome HTTP API Gateway"
  protocol_type = "HTTP"

  cors_configuration = {
    allow_headers = [
      "content-type", "x-amz-date", "authorization", "x-api-key", "x-amz-security-token", "x-amz-user-agent"
    ]
    allow_methods = ["*"]
    allow_origins = ["*"]
  }

  integrations = {
    "GET /products" = {
      lambda_arn             = var.lambda_arn
      payload_format_version = "2.0"
      authorization_type     = "JWT"
      authorizer_key         = "cognito"
      authorization_scopes   = "tf/something.relevant.write"
      # Should comply with the resource server configuration part of the cognito user pool
    }
  }


  tags = {
    Name = "dev-api-new"
  }

}