# Variable block attributes

•  `type` - to identify the type of the variable being declared.

•  `default` - default value in case the value is not provided explicitly.

•  `description` - a description of the variable. This description is also used to generate documentation for the module.

•  `validation` - to define validation rules.

•  `sensitive` - a boolean value. If true, Terraform masks the variable's value anywhere it displays the variable.

## Declaring variable

You can declare a variable directly like this:

```
variable "bucketname" {  
}
```
It will ask the variable while planning itself. Or you can avoid applying plan like below:

```
terraform plan -var="bucketname=mybucket2021"

terraform apply -auto-approve -var="bucketname=mybucket2021"
```

## Here is an example of a terraform plan output:

``terraform.exe plan -var="bucketname=mankindcaption"``

```
# aws_s3_bucket.mybucket will be created
+ resource "aws_s3_bucket" "mybucket" {
+ acceleration_status         = (known after apply)
+ acl                         = (known after apply)
+ arn                         = (known after apply)
+ bucket                      = "mankindcaption"
```

## tfvar files like multiplie enviroment dev, qa, prod
Create qa.tfvar and prod.tfvar seperate files and added the variable in name variable.tf file 

```
variable "username" {
  
}
```
# Plan the terraform using this tfvar flag 
```
terraform.exe plan -var-file="qa.tfvars"
#Output:

  # aws_iam_user.mytfusers will be created
  + resource "aws_iam_user" "mytfusers" {
      + arn           = (known after apply)
      + force_destroy = false
      + id            = (known after apply)
      + name          = "qa-user"
      + path          = "/"
      + tags_all      = (known after apply)
      + unique_id     = (known after apply)
    }

```