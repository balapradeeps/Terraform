variable "ami" {
  description = "choose ami for instance"
  }
variable "instance_type" {
  description = "list of instance trype"
  type = map(string)
  
  default = {
    "dev" = "t2.micro"
    "stage" = "t2.medium"
    "pord"= "t2.large"
  }
}
variable "keypair" {
    description = "value of the instance connecting key pair"
    }