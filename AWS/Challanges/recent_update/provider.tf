terraform{
  backend "s3" {
    bucket  = "minibob-tf-state"
    key     = "jenkins-pipeline-with-tf"
    region  = "ap-south-1"
    encrypt = true
    profile = "default"

  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.32.0"
    }  
  }
}

provider "aws" {
  region = "ap-south-1"
  profile = "default"
}