resource "random_password" "password_generator" {
  length       = 12
  lower        = true
  min_lower    = 3   
  min_numeric  = 3   
  min_special  = 3   
  min_upper    = 3   
  numeric      = true
  special      = true
  upper        = true
  
  }


resource "aws_db_instance" "taskdb" {
    identifier           = "my-db-instance"  # Provide your desired DB identifier here
    allocated_storage    = 10
    db_name              = "tftaskdb" #
    engine               = "mysql"
    engine_version       = "5.7"
    instance_class       = "db.t3.micro"
    username             = "terrauser"
    password             = random_password.password_generator.result
    parameter_group_name = "default.mysql5.7"
    skip_final_snapshot  = true
}

resource "aws_key_pair" "my_key_pair" {
  key_name   = "Monkey-D"
  public_key = file("~/.ssh/id_rsa.pub")  # Update with the path to your public key
}


resource "aws_instance" "rdsconnecter" {
    ami = "ami-0cd59ecaf368e5ccf"
    instance_type = "t2.micro"
    key_name      = aws_key_pair.my_key_pair.key_name  
}


output "rdsconnecterip" {
  value = aws_instance.rdsconnecter.public_ip
}

output "password_result" {
  value = random_password.password_generator.result
  sensitive = true
}