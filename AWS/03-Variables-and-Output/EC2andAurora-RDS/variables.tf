# should specify optional vs required

variable "instance_name" {
  description = "Name of ec2 instance"
  type        = string
  default = "Rav-server"
}

variable "key" {
  description = "Acces key name"
  type = string
  default = "FriendsKey"
  }

variable "ami" {
  description = "Amazon machine image to use for ec2 instance"
  type        = string
  default     = "ami-08e5424edfe926b43" # Ubuntu 20.04 LTS // us-east-1
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "db_user" {
  description = "username for database"
  type        = string
  default     = "foo"
}

variable "db_pass" {
  description = "password for database"
  type        = string
  sensitive   = true
}
