resource "aws_db_instance" "taskdb" {
    identifier           = "my-db-instance"  # Provide your desired DB identifier here
    allocated_storage    = 10
    db_name              = "tftaskdb" #
    engine               = "mysql"
    engine_version       = "5.7"
    instance_class       = "db.t3.micro"
    username             = "terrauser"
    password             = "MaeU8!L#0BX"
    parameter_group_name = "default.mysql5.7"
    skip_final_snapshot  = true
}
