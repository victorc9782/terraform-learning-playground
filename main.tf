terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "eu-west-1"
  profile = "default"
}

resource "aws_instance" "example_server" {
  ami           = "ami-0ce8c2b29fcc8a346"
  instance_type = "t2.micro"

  tags = {
    Name = "TerraformExampleServer"
  }
}