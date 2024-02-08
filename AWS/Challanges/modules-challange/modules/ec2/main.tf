resource "aws_instance" "module_instance" {
    ami = var.amivalue
    instance_type = var.instance-type
    key_name = var.keypair
          tags = {
        Name = "module-server"
    }

  }