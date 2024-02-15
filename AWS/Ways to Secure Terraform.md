# Ways to Secure Terraform 

Enhancing Infrastructure as Code with Examples
Securing Terraform infrastructure as code (IaC) is crucial for safeguarding your cloud resources and preventing misconfigurations. This document outlines effective strategies and provides examples to help you achieve robust security:

## Use the sensitive attribute

- Terraform provides a sensitive attribute that can be used to mark variables and outputs as sensitive. When a variable or output is marked as sensitive, Terraform will not print its value in the console output or in the state file.


## Secret Management Systems (SMS)
- Store sensitive data in a secret management system. A secret management system is a dedicated system for storing sensitive data, such as passwords, API keys, and SSH keys. Terraform can be configured to read secrets from a secret management system, such as HashiCorp Vault or AWS Secrets Manager.

Example:

- Store your database password in HashiCorp Vault and retrieve it within Terraform using the vault_generic_secret data source:

  ```terraform
  data "vault_generic_secret" "db_password" {
    path = "secret/database/password"
  }

  resource "aws_db_instance" "prod_db" {
    engine    = "mysql"
    password  = data.vault_generic_secret.db_password.value
    ...
  }
  ```

## Remote Backend

- Encrypt sensitive data. The Terraform state file can be encrypted to protect sensitive data. This can be done by using a secure remote backend, such as Terraform Cloud or S3.

Example:
- Terraform Cloud to encrypt your state file:

  ```terraform
  terraform workspace select dev

  terraform init -backend-remote

  terraform encrypt
  ```

## Environment Variables

- Use environment variables. Sensitive data can also be stored in environment variables. Terraform can read environment variables when it is run.

Here are some specific examples of how to use these methods:

To mark a variable as sensitive, you would add the sensitive attribute to the variable declaration. 



  ```terraform
  export AWS_ACCESS_KEY_ID=YOUR_ACTUAL_ACCESS_KEY_ID

  variable "aws_access_key_id" {
    source = "env://AWS_ACCESS_KEY_ID"
  }

  resource "aws_s3_bucket" "my_bucket" {
    bucket = "my-secure-bucket"
    acl    = "private"
    ...
  }
  ```

  **Caution:** While convenient, limit this approach to non-critical secrets due to potential visibility.

# Enhancing Code Security

## Static Code Analysis Tools:

Example:
- Integrate Checkov into your CI/CD pipeline to scan code for potential security vulnerabilities:

  ```yaml
  jobs:
    security:
      runs-on: ubuntu-latest
      steps:
        - uses: actions/checkout@v3
        - name: Run Checkov
          uses: bridgecrewio/checkov-action@v1
          with:
            directory: .
            framework: terraform
  ```

## Least Privilege Access:

Example:
- Create an IAM role for Terraform deployments with limited permissions to create and manage specific AWS resources:

  ```json
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "states.amazonaws.com"
        },
        "Action": [
          "sts:AssumeRole"
        ]
      },
      {
        "Effect": "Allow",
        "Principal": {
          "AWS": "arn:aws:iam::YOUR_ACCOUNT_ID:root"
        },
        "Action": "sts:AssumeRole"
      },
      {
        "Effect": "Allow",
        "Action": [
          "ec2:CreateInstances",
          "ec2:DescribeInstances",
          "iam:PassRole",
          "s3:CreateBucket",
          "s3:PutObject",
          "s3:GetObject"
        ],
        "Resource": [
          "*"
        ]
      }
    ]
  }
  ```


## Version Control and Auditing:

Example:
- Use GitLab Enterprise Edition with Terraform Enterprise integration for granular control and audit logs.

Operational Best Practices:

## CI/CD Integration:

Example:
- Use GitHub Actions to automatically scan, test, and deploy changes on push:

  ```yaml
  jobs:
    build:
      runs-on: ubuntu-latest
      steps:
        - uses: actions/checkout@v3
        - name: Run Checkov
          uses: bridgecrewio/checkov-action@v1
          with:
            directory: .
            framework: terraform
        - name: Terraform Apply
          run: terraform apply
  ```

## Disaster Recovery Planning:

Example:
- Back up your Terraform state file to S3 with server-side encryption. Use terraform import to recover resources if needed.

## Continuous Monitoring:

Example:
- Use AWS CloudTrail to monitor API calls made by Terraform and detect potential misuse or misconfigurations.

