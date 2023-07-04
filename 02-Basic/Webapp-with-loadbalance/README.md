Issuse we Faced:

## Issuse 01:
  Error: Unsupported argument
  on mai.tf line 52, in data "aws_subnets" "default_subnet":
 52:   vpc_id = data.aws_vpc.default_vpc.id An argument named "vpc_id" is not expected here.
The state of argument rejected is not available in buck minibob-tf-state

Solution 01:
You are getting this error because the vpc_id argument is not supported for the aws_subnets data source. 
The vpc_id argument was deprecated in Terraform 0.13 and removed in Terraform 0.14.

To fix this error, you need to remove the vpc_id argument from the aws_subnets data source.

Here is the corrected code:
```
data "aws_subnets" "default" {}

output "subnet_ids" {
  value = data.aws_subnets.default.ids
}

```

This code will get the subnet IDs for all of the subnets in the default VPC. 
You can then use the subnet_ids output to create resources that depend on the subnet IDs.

----------------------------------------------------------------------------------------------------
