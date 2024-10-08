resource "aws_ecr_repository" "demo2" {
  name = "demo2"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }
}

output "ecr_repository_url" {
  value = aws_ecr_repository.demo2.repository_url  
}
