provider "aws" {
    alias = "n-virgina"
    region = "us-east-1"
  }

provider "aws" {
  alias = "ohio"
  region = "us-east-2"
}

resource "aws_instance" "newinstance" {
  #ami = "ami-0277155c3f0ab2930"
  ami = "ami-0866a04d72a1f5479"
  instance_type = "t2.micro"
  provider = aws.ohio

  tags = {
    Name = "TerraformEC2"
  }
}

output "ec2address" {
 value = aws_instance.newinstance.public_ip
}

output "dnsinfo" {
  value = aws_instance.newinstance.public_dns
  
}