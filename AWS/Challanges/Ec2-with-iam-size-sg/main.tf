data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_vpc" "task-vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "tf-task"
  }
}


resource "aws_subnet" "task_subnet" {
  vpc_id            = aws_vpc.task-vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "tf-task"
  }
}

resource "aws_security_group" "task-sg" {
    name = "added-list"
    description = "Allow inbound and outbount ip address"
    vpc_id = aws_vpc.task-vpc.id

    ingress {
        description = "port all"
        from_port = 80 
        to_port = 80
        protocol ="tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
 tags = {
    Name = "task-sg"
 }
 
}

resource "aws_instance" "web-server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  security_groups = [aws_security_group.task-sg.id]
  subnet_id = aws_subnet.task_subnet.id

  root_block_device {
    volume_size = 8 #GB
    volume_type = "gp3"
  }

  tags = {
    Name = "task-server"
  }
}