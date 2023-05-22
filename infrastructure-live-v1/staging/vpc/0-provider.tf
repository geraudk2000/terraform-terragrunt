# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  alias = "dev"

  access_key = var.dev_aws_key
  secret_key = var.dev_aws_secret

}

terraform {
  required_version = ">=1.4"

  backend "local" {
    path = "staging/vpc/terraform.tfstate"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.62"
    }

  }
}