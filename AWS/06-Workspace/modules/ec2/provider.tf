terraform {
  #backend "s3" {
  #  bucket = "minibob-tf-state"
  # key = "module-recreate"
  #  region = "ap-south-1"
  # encrypt = true
  #}
  required_providers {
    aws = {
     source = "hashicorp/aws"
     version = "5.32.0"
     
    }
  }
}
provider "aws" {
  region = "us-east-1"
}