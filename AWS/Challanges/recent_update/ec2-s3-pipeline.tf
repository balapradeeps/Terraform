data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical's AWS Account ID

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_key_pair" "jk_local_keypair" {
  key_name = "jk-cskeypair"
  public_key = file ("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "ecc-pipeline" {
  ami           = data.aws_ami.ubuntu.id 
  instance_type = "t2.micro"
  key_name      = aws_key_pair.jk_local_keypair.key_name

  tags = {
    Name = "Pipeline compute"
  }
}

resource "aws_s3_bucket" "bucket_pipeline" {
  bucket = "jkcspipeline001"

  tags = {
    Name = "Pipeline Bucket"
  }
}

output "ec2_instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.ecc-pipeline.public_ip
}

output "s3_bucket_details" {
  description = "Details of the S3 bucket"
  value = {
    bucket_name = aws_s3_bucket.bucket_pipeline.bucket
    arn         = aws_s3_bucket.bucket_pipeline.arn
  }
}