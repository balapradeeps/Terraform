terraform {
  backend "s3" {
    bucket = "minibob-tf-state"
    region = "ap-south-1"
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
  # Configuration options
  region = "us-east-1"
}