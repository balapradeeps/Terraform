terraform {
  backend "s3" {
    bucket = "minibob-tf-state"
    region = "ap-south-1"
    key = "ec2withvpc-2024"
    encrypt = true
    
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.10.0"
    }
  }
}

provider "aws" {
  #  alias = "n-virgina"
    region = "us-east-1"
  }

#provider "aws" {
# alias = "ohio"
#  region = "us-east-2"
#}