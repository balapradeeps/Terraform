terraform {
      backend "s3" {
    bucket = "minibob-tf-state"
    region = "ap-south-1"
    encrypt = true
      }
  required_providers {
    github = {
      source = "integrations/github"
      version = "5.44.0"
    }
  }
}


provider "github" {
  # Configuration options
  token = var.token
}