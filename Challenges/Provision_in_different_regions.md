How to create resources in two different regions
Use-case: Create two ec2 instances, first ec2 instance in us-east-1 region and second ec2 instance in ap-south-1 region
Solution: By using multiple provider aliases we can achive
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
        region = "us-east-1"
        alias = "us-east-1"
    }
    provider "aws" {
        region = "ap-south-1"
        alias = "ap-south-1"
    }
    resource "aws_instance" "first_ec2" {
        provider = aws.us-east-1
        ami = "ami-0df8c184d5f6ae949"
        instance_type = "t2.micro"
    }
    resource "aws_instance" "second_ec2" {
        provider = aws.ap-south-1
        ami = "ami-0d2614eafc1b0e4d2"
        instance_type = "t2.micro"
    }