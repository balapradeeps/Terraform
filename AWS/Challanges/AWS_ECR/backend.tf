terraform {
  backend "s3" {
    bucket = "minibob-tf-state"
    key = "aws-ecr-tf"
    region =  "ap-south-1"
    encrypt = true   
  }
}