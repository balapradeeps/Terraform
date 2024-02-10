# Create a key pair
resource "aws_key_pair" "my_key_pair" {
  key_name   = "Monkey-D"
  public_key = file("~/.ssh/id_rsa.pub")  # Update with the path to your public key
}

# Create a security group allowing inbound and outbound traffic on ports
resource "aws_security_group" "websg" {
  name        = "web-sg"
  description = "Allow inbound traffic on ports from all sources"

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Update server"
    from_port   = 55252
    to_port     = 55252
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "flex manual update"
    from_port = 62282
    to_port   = 62282
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web-sg"
  }
}

# Create an EC2 instance that depends on the key pair and security group
resource "aws_instance" "my_instance" {
  ami           = "ami-06aa3f7caf3a30282"  # Update with your desired AMI
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_key_pair.key_name
  #vpc_security_group_ids = [ aws_security_group.websg.id ]
  #security_groups = [aws_security_group.my_security_group.name]
  security_groups = [aws_security_group.websg.name]
  #subnet_id              = aws_subnet.sub1.id

      connection {
      type = "ssh"
      user = "ubuntu"
      private_key = file("~/.ssh/id_rsa")
      host = self.public_ip
    }

    provisioner "file" {
      source = "app.py"
      destination = "/home/ubuntu/app.py"
    }

    provisioner "file" {
      source = "script.sh"
      destination = "/home/ubuntu/script.sh"
    }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ubuntu/script.sh",  # Make the script executable
      "/home/ubuntu/script.sh",           # Execute the script
    ]
  }

}