To migrate the existing infrastructure to Terraform, you need to define Terraform configurations for each component of your infrastructure. Here's a step-by-step guide on how to achieve this:

1. **Define Terraform Configuration Files**: Create separate Terraform configuration files for each component of your infrastructure (S3 buckets, EC2 instances, AWS Amplify, RDS serverless instance, etc.).

2. **Initialize Terraform Environment**: Set up a new Terraform environment in your local development environment or on your preferred infrastructure as code (IaC) platform.

3. **Define S3 Bucket Configuration**: Define a Terraform configuration file for creating the S3 bucket in the `ap-south-2` region. Include configurations for bucket properties, such as bucket name, region, access control, and any bucket policies.

4. **Define EC2 Instance Configuration**: Create a Terraform configuration file for the EC2 instance in the `us-east-1` region. Specify configurations such as instance type, AMI, key pair, security groups, and any additional settings required.

5. **Define AWS Amplify Configuration**: Configure AWS Amplify in the `ap-south-1` region using Terraform. Include configurations for Amplify application setup, including hosting, custom domains, environment variables, and any other relevant settings.

6. **Define RDS Serverless Instance Configuration**: Create a Terraform configuration file for the RDS serverless instance in the `us-east-1` region. Specify configurations such as DB instance type, storage, engine version, VPC settings, security groups, and any other required settings.

7. **Define IAM Roles and Policies**: Define Terraform configurations for any IAM roles and policies required for your infrastructure components. Ensure that appropriate permissions are granted to access and manage AWS resources.

8. **Define Dependencies and Connections**: Define dependencies and connections between different components of your infrastructure. For example, configure the EC2 instance to access the RDS serverless instance using its endpoint and credentials securely.

9. **Test and Validate Configuration**: Test your Terraform configurations in a staging environment to ensure that they are correctly defined and provision resources as expected.

10. **Apply Terraform Configuration**: Once you are satisfied with the configurations, apply them to your AWS account using the `terraform apply` command. Terraform will create, update, or delete resources based on the defined configurations.

11. **Monitor and Maintain**: Monitor your infrastructure using AWS services or third-party tools to ensure that it is running smoothly. Update Terraform configurations as needed to reflect any changes or updates to your infrastructure requirements.

By following these steps, you can migrate your existing infrastructure to Terraform and manage it more effectively using infrastructure as code principles. Remember to follow best practices for infrastructure management and security while working with Terraform.