module "ec2_module" {
  source = "./modules/ec2"
  amivalue = "ami-0277155c3f0ab2930"
  instance-type = "t2.micro"
  keypair = "RND_WEB"
}