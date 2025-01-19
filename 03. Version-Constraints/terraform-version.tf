# https://releases.hashicorp.com/terraform/

terraform {
  required_providers {
    aws = {
      version = "~> 3.15.0"
    }
    random = {
      version = "> 2.2.0"
    }
  }

#   required_version = "~> 1.4.0"
  required_version = "~> 1.9.0"
}