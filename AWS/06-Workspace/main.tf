module "ws" {
  source = "./modules/ec2"
  ami = var.ami
  instance-type = lookup(var.instance_type, terraform.workspace, t2.micro)
  keypair = var.keypair
  }