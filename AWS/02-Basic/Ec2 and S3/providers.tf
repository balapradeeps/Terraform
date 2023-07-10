terraform {
  backend "s3" {
  bucket = "minibob"
  region = "ap-south-1"
  encrypt = true
}
}

provider "aws" {
  region = "ap-south-1"
  shared_credentials_file ="$HOME"
}
