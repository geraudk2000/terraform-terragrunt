provider "aws" {
  region = "us-east-1"
  alias = "PROD"

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