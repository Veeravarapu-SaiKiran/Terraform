1. How to use same provider with multiple versions to create different resources.
   Usecase:
       I want to create ec2 instance with one aws provider version and s3 bucket with other provider version.
   Solution:
       To use multiple versions of a provider for different resources in Terraform, you can achieve this by utilizing provider aliases. Each alias allows you to configure and use a different version or configuration of the same provider.
       
       Steps to Use Multiple Provider Versions:
         1. Specify Required Providers with Aliases
            In your terraform block, define the required provider versions.

            Example:

            terraform {
                required_providers {
                    aws = {
                    source  = "hashicorp/aws"
                    version = ">= 4.0"
                    }
                }
            }

            provider "aws" {
                alias   = "v1"
                version = "4.0.0"
                region  = "us-east-1"
            }

            provider "aws" {
                alias   = "v2"
                version = "4.5.0"
                region  = "us-west-2"
            }
         2. Associate Resources with Specific Providers 
         In your resource blocks, reference the appropriate provider alias using the provider argument.

         Example:
            ```       
            # Resource using the first provider alias (v1)
            resource "aws_instance" "example_v1" {
            ami           = "ami-0c55b159cbfafe1f0"
            instance_type = "t2.micro"

            provider = aws.v1
            }

            # Resource using the second provider alias (v2)
            resource "aws_s3_bucket" "example_v2" {
            bucket = "my-bucket-v2"
            acl    = "private"

            provider = aws.v2
            }
            ```

Explanation:
1. Provider Aliases:

    a. Define multiple instances of the same provider using the alias argument.
    b. Each instance can have its own version and configuration.

2. Resource Association:
   Use the provider argument in resource blocks to associate the resource with a specific provider alias.