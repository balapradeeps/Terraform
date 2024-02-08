terraform {
  backend "s3" {
    bucket = "minibob-tf-state"
    key = "module-recreate1"
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
  region = "us-east-1"
}