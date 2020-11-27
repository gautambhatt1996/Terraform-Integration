terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}


# Configure the AWS Provider
  provider "aws" {
  region = "us-east-1"
  access_key= ""
  secret_access_key = ""
}

# Create a VPC
  resource "aws_vpc" "main" {
  cidr_block = "190.160.0.0/16"
  instance_tenancy= "default"

  tags = {

  Name="main"
  Location = "Dehradun"
  }
}

# Create a Subnet
  resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "190.160.1.0/24"

  tags = {
    Name = "Subnet1"
  }
}

#Create an EC2 instance

  resource "aws_instance" "my-first-ec2-instance" {
  ami = ""
  instance_type = "t2.micro"

  tags = {
    Name = "Gautam's EC2 instance"
    Place = "Dehradun"
    } 
}
