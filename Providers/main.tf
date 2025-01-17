# Terraform Block Example Link: https://developer.hashicorp.com/terraform/language/terraform
# Required providers Link: https://developer.hashicorp.com/terraform/language/providers/requirements#requiring-providers
# Terraform Client Version Link: https://developer.hashicorp.com/terraform/install

terraform {
  required_version = ">= 1.9.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.84.0"
    }
  }
}

provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}

# We can hardcode authentication details for a user with access_key, secret_key like below in provider block
# provider "aws" {
#   region = "ap-south-1"
#   access_key = "xxxx"
#   secret_key = "xxxx"
# }