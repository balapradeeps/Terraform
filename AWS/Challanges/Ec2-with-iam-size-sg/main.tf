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
resource "aws_internet_gateway" "web_server_igw" {
  vpc_id = aws_vpc.task-vpc.id

  tags = {
    Name = "web-server-igw"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.task-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.web_server_igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public_route_association" {
  subnet_id      = aws_subnet.task_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}


resource "aws_security_group" "task-sg" {
    name = "added-list"
    description = "Allow inbound and outbount ip address"
    vpc_id = aws_vpc.task-vpc.id

    ingress {
        description = "Http"
        from_port = 80 
        to_port = 80
        protocol ="tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Https"
        from_port = 443 
        to_port = 443
        protocol ="tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Custom-upper"
        from_port = 55252 
        to_port = 55252
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

/*
resource "aws_eip" "web_server_eip" {
  instance = aws_instance.web-server.id
}
*/

resource "aws_instance" "web-server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = "RND_WEB"
  subnet_id = aws_subnet.task_subnet.id
  security_groups = [aws_security_group.task-sg.id]
  associate_public_ip_address = true  # Ensure the instance gets a public IP

  root_block_device {
    volume_size = 8 #GB
    volume_type = "gp3"
  }

  tags = {
    Name = "task-server"
  }
}