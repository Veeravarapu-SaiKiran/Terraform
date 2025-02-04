terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.84.0"
    }
  }
}

# Default Provider as alias is absent
provider "aws" {
  region = "us-east-1"
  profile = "default"
}

# Provider for us-east-2
provider "aws" {
  region = "us-east-2"
  profile = "default"
  alias = "us-east-2"
}

resource "aws_instance" "webserver" {
  provider = aws
  ami           = "ami-0f844a9675b22ea32"  // Amazon Linux 2 AMI
  instance_type = "t2.micro"

  tags = {
    Name        = "webserver"
  }
}

resource "aws_instance" "db" {
  provider = aws.us-east-2  // <PROVIDER NAME>.<ALIAS>
  ami           = "ami-05e1405c57ab23683" // Amazon Linux 2 AMI
  instance_type = "t2.micro"

  tags = {
    Name        = "db"
  }
}