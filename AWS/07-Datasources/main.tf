resource "aws_instance" "ubuntu" {
  
  ami = "ami-0277155c3f0ab2930"
  instance_type =  "t2.micro"
  key_name = "RND_WEB"

  tags = {
    Name ="Terraform EC321-server"
  }
}


data "aws_instance" "myinstance" {
    filter {
      name = "tag:Name"
      values = ["Terraform EC321-server"]
    }
  depends_on = [ 
    aws_instance.ubuntu
    ]
}


output "data-test" {
    value = data.aws_instance.myinstance.public_ip
  
}

output "data-test-2" {
  value = data.aws_instance.myinstance.private_ip
  }

/*
output "nrml" {
    value = aws_instance.ubuntu.public_ip
  
}*/