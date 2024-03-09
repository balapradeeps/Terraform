Link : https://aws.amazon.com/es/solutions/implementations/instance-scheduler-on-aws/
To achieve automated start and stop of Amazon EC2 and Amazon RDS instances on AWS, you can implement the Instance Scheduler solution. Here's a high-level overview of how you can set it up:

1. **Architecture Overview**:
   - The Instance Scheduler solution typically involves setting up AWS Lambda functions, Amazon CloudWatch Events, and possibly AWS Systems Manager Automation documents or AWS Step Functions.
   - Lambda functions will be responsible for starting and stopping instances based on defined schedules.
   - CloudWatch Events will trigger these Lambda functions based on specified time intervals or cron expressions.

2. **Setup Lambda Functions**:
   - Create Lambda functions for starting and stopping EC2 instances and RDS instances. These functions will use the AWS SDK to interact with the AWS APIs.
   - Ensure that these Lambda functions have the necessary permissions to describe, start, and stop instances.

3. **Define Schedules**:
   - Define schedules for when instances should start and stop. You can do this by creating JSON configuration files or storing schedule information in a database.
   - Schedules can be defined based on time of day, days of the week, or other criteria depending on your specific requirements.

4. **Trigger Lambda Functions**:
   - Configure CloudWatch Events rules to trigger the Lambda functions at the specified times according to the defined schedules.
   - Use cron expressions or fixed rate intervals to trigger the Lambda functions at the desired frequency.

5. **Testing and Validation**:
   - Test the Instance Scheduler solution thoroughly to ensure that instances start and stop according to the defined schedules.
   - Monitor logs and CloudWatch metrics to verify that the solution is working as expected.

6. **Optimization and Fine-Tuning**:
   - Continuously monitor and optimize the schedules based on usage patterns and cost optimization goals.
   - Consider implementing additional features such as tagging instances for more granular scheduling, integrating with AWS Cost Explorer for cost analysis, or using AWS Budgets for cost management alerts.

7. **Documentation and Maintenance**:
   - Document the Instance Scheduler solution including configuration details, schedules, and any customizations made.
   - Establish regular maintenance tasks to review and update schedules, Lambda functions, and other components as needed.

By following these steps, you can implement an Instance Scheduler solution on AWS to automate the start and stop of EC2 and RDS instances, thereby reducing operational costs and improving resource utilization.


## Reference for Ec2 start and stop: 

This Python code defines two Lambda functions, start_ec2_instances and stop_ec2_instances, which start and stop EC2 instances respectively based on specified tags (AutoStart and AutoStop).

To use this code:

1. Ensure you have the necessary IAM permissions for Lambda to interact with EC2 instances.
2. Create Lambda functions in the AWS Management Console or using AWS CLI.
3. Upload this Python code as the function code for the respective Lambda functions.
4. Configure CloudWatch Events rules to trigger these Lambda functions at the desired schedule intervals.
Make sure to adjust the code as needed for your specific requirements and environment. Additionally, consider error handling, logging, and testing to ensure the reliability and correctness of the Lambda functions.


Another Link: https://stackoverflow.com/questions/66364247/how-to-stop-and-start-ec2-instance-using-boto3-and-lambda-function