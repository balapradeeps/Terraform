# Terraform Provisioners

• Terraform has three types of provisioners: **file, remote-exec, and local-exec**.

• Each provisioner requires a connection block that specifies the type, user, private key, and host of the connection.

##  The file provisioner copies files or directories from the local machine to a remote machine.

In this example, the `upload-file` provisioner copies the `localfile.txt` from the local machine to the `/path/on/remote/instance/upload-file.txt` location on the AWS EC2 instance using an SSH connection

# Copy a file to an AWS EC2 instance
```
resource "aws_instance" "example" {
ami           = "ami-0c55b159cbfafe1f0"
instance_type = "t2.micro"
}

provisioner "file" {
source      = "local/path/to/localfile.txt"
destination = "/path/on/remote/instance/upload-file.txt"
connection {
type     = "ssh"
user     = "ec2-user"
private_key = file("~/.ssh/id_rsa")
  }
}
```

## The remote-exec provisioner runs scripts or commands on a remote machine.
 
 In this example, the `remote-exec` provisioner connects to the AWS EC2 instance using SSH and runs a series of commands to update the package repositories, install Apache HTTP Server, and start the HTTP server.


### Run commands on an AWS EC2 instance
```
resource "aws_instance" "example" {
ami           = "ami-0c55b159cbfafe1f0"
instance_type = "t2.micro"
}

provisioner "remote-exec" {
inline = [
"sudo yum update -y",
"sudo yum install -y httpd",
"sudo systemctl start httpd",
]

connection {
type        = "ssh"
user        = "ec2-user"
private_key = file("~/.ssh/id_rsa")
host        = aws_instance.example.public_ip
  }
}
```

## The local-exec provisioner runs scripts or commands on the local machine.

In this example, a `null_resource` is used with a `local-exec` provisioner to 
run a simple local command that echoes a message to the console whenever Terraform is applied or refreshed. The `timestamp()` function ensures it runs each time.

### Run a command on the local machine
```
resource "null_resource" "example" {
triggers = {
always_run = "${timestamp()}"
}

provisioner "local-exec" {
command = "echo 'This is a local command'"
  }
}
```
### One More Example 

```
# Get the login command for AWS ECR
data "aws_ecr_authorization_token" "auth" {}

resource "null_resource" "docker_build_and_push"{
  provisioner "local-exec" {
    command = <<EOT
    aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin ${data.aws_ecr_authorization_token.auth.proxy_endpoint}

  # Build the Docker Image 
    docker build -t demo2todo-app ./
  # Tag the Docker Image 
    docker tag demo2todo-app:latest ${aws_ecr_repository.demo2.repository_url}:latest
  # Push the Docker Image to ECR
    docker push ${aws_ecr_repository.demo2.repository_url}:latest
    EOT
  }
}
```

