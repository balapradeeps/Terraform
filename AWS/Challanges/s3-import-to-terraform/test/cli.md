```
terraform plan -generate-config-out=generate_resource.tf
```
```
﻿scp -r boss@192.168.1.2:/mnt/ntfs/devops_backup/Terraform/AWS/last-test/generate_resource.tf .
```
```
terraform.exe import aws_instance.myinstance i-05e5fc08918d07101
```
