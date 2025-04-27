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

resource "aws_security_group" "default_ec2" {
  name        = "default_ec2"
  description = "Security group with no inbound traffic"

  # No inbound rules defined - all inbound traffic blocked

  # Allow all outbound traffic (this is the default)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "default-ec2"
  }
}

resource "aws_instance" "example_server" {
  ami           = "ami-0ce8c2b29fcc8a346"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.default_ec2.id]

  tags = {
    Name = "TerraformExampleServer"
  }
}