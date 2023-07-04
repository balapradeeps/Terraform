resource "aws_instance" "example" {
  ami           = "ami-08e5424edfe926c43" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"
  key_name = "Friendskey"
  }

  resource "aws_s3_bucket" "terraform-state" {
    bucket = "minbob"
    versioning {
      enabled = true
    }
    
  }
