resource "aws_instance" "module_instance" {
    ami = var.ami
    instance_type = var.instance-type
    key_name = var.keypair
  }