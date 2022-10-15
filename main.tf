# The configuration for the `remote` backend.
terraform {
  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "renata-corporation"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      aws = {
        source = "hashicorp/aws"
      }
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile                 = "default"
  region                  = "sa-east-1"
  shared_credentials_file = "~/.aws/credentials"
}