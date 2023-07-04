Course covering topics 
1. Evolution of Cloud + Infrastructure as Code
3. Terraform Overview + Setup
4. Basic Terraform Usage
5. Variables and Outputs
6. Language Features
7. Project Organization + Modules
8. Managing Multiple Environments
9. Testing Terraform Code
10. Developer Workflows


## What is Terraform 

• Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently
• Enables application software best practices to infrastructure
• Compatible with many clouds and services (AWS, GCP, Azure & DO)

## Basic Usage Sequences

• terraform init
• terraform plan
• terraform apply
• terraform destroy

## State File
• Terraform's representation of the world
• JSON file containing information about every resource and data object
• Contains Sensitive Info (e.g.
database password)
• Can be stored locally or remotely

### Local Backend
1. Simple to get started!
2. Sensitive values in plain text
3. Uncollaborative
4. Manual

### Remote Backend
1. Terraform Cloud, Amazon S3 and Azure Blog Storage
2. Sensitive data encrypted 
3. Collaboration Possible 
4. Automation Possible 
5. increased complexity 

 *Terraform apply desired state and Actual state example:

![[Pasted image 20230703185437.png]]

*Terraform destroy use only on project cleanup completely :

![[Pasted image 20230703185715.png]]

*Terraform State file save in S3 with DynamoDB, We are using DynamoDB for terraform state lock it will avoid the multiple user can't use single state file make conflict 

![[Pasted image 20230703190351.png]]

![[Pasted image 20230704182127.png]]

![[Pasted image 20230704182802.png]]


![[Pasted image 20230704204715.png]]

![[Pasted image 20230704205318.png]]


![[Pasted image 20230704205333.png]]

![[Pasted image 20230704205340.png]]


![[Pasted image 20230704205420.png]]