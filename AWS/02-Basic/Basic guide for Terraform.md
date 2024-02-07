Basic guide for HashiCorp Configuration Language (HCL) in Terraform

```
/*
  HashiCorp Configuration Language (HCL) is used in Terraform for infrastructure as code.
  This is a multi-line comment, starting with a slash star and ending with a star slash.
*/
```
# Basic Concepts in Terraform

## Block
### A block can be a resource, provider, data, network, variable, or output.

resource aws_instance "name"{ 
attritebute1 = value1 
attritebute2 = value2 
}

```
resource "aws_instance" "example_instance" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  key_name      = var.key_name
}

```
## Attributes
### Key = Value pairs

```
variable "key_name" {
  type        = string
  description = "Name of the key pair for EC2 instance"
}
```

## Data Types
### "String" is always in double quotes
### number: 2
### boolean: Is either true or false
### List:  is always in square bracket ["item1", "item2", "item3"]

```
resources "aws_security" "sg" {
security_groups = ["sg-1223, "sg-2124", "sg-32321"]
}
```

### maps: 
default = { key1 = "value1", key2 = "value2" }
my_map={"name" = "Jhonydeep", "age" = 30, "is_he_admin" = true}

```hcl
variable "example_map" {
  type    = map
  default = { key1 = "value1", key2 = "value2" }
}

locals {
  my_map = {
    "name"        = "Jhonydeep"
    "age"         = 30
    "is_he_admin" = true
  }
}
```

## Conditions
### Example: If CPU usage is 50%, create one more EC2 instance using auto scale.
### Another scenario: If RDS is private, create a VPC to connect EC2.

```hcl
resource "aws_instance" "server" {
  instance_type = var.environment == "development" ? "t2.micro" : "t2.small"
}
```

## Resource Dependencies
### Dependencies between resources, e.g., ACL is set to public after creating an S3 bucket.

```
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.mybucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  depends_on = [aws_s3_bucket_acl.example]
}
```
