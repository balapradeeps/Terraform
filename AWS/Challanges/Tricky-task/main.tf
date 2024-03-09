# Define provider
provider "aws" {
  region = "us-east-1"  # Update with your desired region
}

# Create IAM role for Lambda functions
resource "aws_iam_role" "lambda_role" {
  name = "instance_scheduler_lambda_role"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

# Attach IAM policy to Lambda role
resource "aws_iam_policy_attachment" "lambda_policy_attachment" {
  name       = "instance_scheduler_lambda_policy_attachment"
  roles      = [aws_iam_role.lambda_role.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"  # Example policy for Lambda execution
}

# Create Lambda function for starting EC2 instances
resource "aws_lambda_function" "start_ec2_instances" {
  filename      = "start_ec2_instances.zip"  # Path to your Lambda function code
  function_name = "start_ec2_instances"
  role          = aws_iam_role.lambda_role.arn
  handler       = "start_ec2_instances.lambda_handler"
  runtime       = "python3.8"  # Example runtime for Python function
}

# Create CloudWatch Events rule for triggering Lambda function to start instances
resource "aws_cloudwatch_event_rule" "start_ec2_schedule" {
  name                = "start_ec2_schedule"
  schedule_expression = "cron(0 8 * * ? *)"  # Example schedule (every day at 8 AM UTC)
}

# Associate CloudWatch Events rule with Lambda function to start instances
resource "aws_cloudwatch_event_target" "start_ec2_target" {
  rule      = aws_cloudwatch_event_rule.start_ec2_schedule.name
  target_id = "start_ec2_target"
  arn       = aws_lambda_function.start_ec2_instances.arn
}

# Create Lambda function for stopping EC2 instances
resource "aws_lambda_function" "stop_ec2_instances" {
  filename      = "stop_ec2_instances.zip"  # Path to your Lambda function code
  function_name = "stop_ec2_instances"
  role          = aws_iam_role.lambda_role.arn
  handler       = "stop_ec2_instances.lambda_handler"
  runtime       = "python3.8"  # Example runtime for Python function
}

# Create CloudWatch Events rule for triggering Lambda function to stop instances
resource "aws_cloudwatch_event_rule" "stop_ec2_schedule" {
  name                = "stop_ec2_schedule"
  schedule_expression = "cron(0 20 * * ? *)"  # Example schedule (every day at 8 PM UTC)
}

# Associate CloudWatch Events rule with Lambda function to stop instances
resource "aws_cloudwatch_event_target" "stop_ec2_target" {
  rule      = aws_cloudwatch_event_rule.stop_ec2_schedule.name
  target_id = "stop_ec2_target"
  arn       = aws_lambda_function.stop_ec2_instances.arn
}

/*
This Terraform code sets up the infrastructure components required for 
scheduling both the start and stop of EC2 instances using Lambda functions triggered by CloudWatch Events.
*/