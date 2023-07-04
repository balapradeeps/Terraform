terraform {
  backend "s3" {
  bucket = "minibob-tf-state"
  region = "ap-south-1"
  encrypt = true
}
}

provider "aws" {
  region = "ap-south-1"
  #shared_credentials_file ="$HOME"
  #shared_credentials_files = "$HOME/minibob"
}
