resource "aws_instance" "instance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = var.key

  tags = {
    Name     = var.instance_name
    ExtraTag = local.extra_tag
  }
}
locals {
  extra_tag = "my-custom-tag"
}


resource "aws_rds_cluster" "aurora_db_cluser" {
  cluster_identifier      = "aurora-cluster-demo"
  engine                  = "aurora-mysql"
  engine_version          = "5.7.mysql_aurora.2.11.2"
  availability_zones      = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  database_name           = "myterdb"
  master_username         = var.db_user
  master_password         = var.db_pass
  backup_retention_period = 1
  #preferred_backup_window = "07:00-09:00"
  skip_final_snapshot       = true
  apply_immediately = true
}

