variable "lambda_arn" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
  default     = "arn:aws:lambda:sa-east-1:251675404411:function:hello-world-lambda-dev-hello"
}