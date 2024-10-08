# Get the login command for AWS ECR
data "aws_ecr_authorization_token" "auth" {}

resource "null_resource" "docker_build_and_push"{
  provisioner "local-exec" {
    command = <<EOF
    aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin ${data.aws_ecr_authorization_token.auth.proxy_endpoint}

  # Build the Docker Image 
    docker build -t demo2todo-app .
  # Tag the Docker Image 
    docker tag demo2todo-app:latest ${aws_ecr_repository.demo2.repository_url}:latest
  # Push the Docker Image to ECR
    docker push ${aws_ecr_repository.demo2.repository_url}:latest

    EOT
  }
}
