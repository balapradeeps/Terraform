terraform {
  backend "s3" {
    bucket = "minibob-tf-state"
    key = "s3importtoterraform"
    region = "ap-south-1"
    
  }
}