terraform {

  cloud {
    organization = "renata-corporation"

    workspaces {
      name = "learning-aws-lambda-with-serverless"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.28.0"
    }
  }

  required_version = ">= 1.1.0"
}
