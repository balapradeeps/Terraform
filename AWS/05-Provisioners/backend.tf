terraform {
  backend "s3" {
    bucket = "minibob-tf-state"
    key = "provisioners"
    region = "ap-south-1"
  }
}