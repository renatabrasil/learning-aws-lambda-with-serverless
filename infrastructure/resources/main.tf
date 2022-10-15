#terraform {
#  backend "remote" {
#    organization = "renata-corporation"
#    workspaces {
#      name = "learning-aws-lambda-with-serverless"
#    }
#  }
#  required_providers {
#    aws = {
#      source = "hashicorp/aws"
#    }
#  }
#
#  required_version = ">= 0.14.9"
#}
#
#provider "aws" {
#  profile                 = "default"
#  region                  = "sa-east-1"
#  shared_credentials_file = "~/.aws/credentials"
#}
