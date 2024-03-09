data "aws_iam_policy_document" "role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "lambda_role_for_iam"
  assume_role_policy = data.aws_iam_policy_document.role.json
}

resource "aws_iam_role_policy_attachment" "lambda_logs_policy_attachment" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}


data "archive_file" "py_function" {
  type = "zip"
  source_file = "lambda.py"
  output_path = "lambda_function_status.zip"
}

resource "aws_lambda_function" "task_lambda" {
  filename = data.archive_file.py_function.output_path #or "lambda_function_status.zip"
  function_name = "taskoftf"
  role = aws_iam_role.iam_for_lambda.arn
  handler = "lambda.lambda_handler"
  runtime = "python3.8"
  timeout = 10
  memory_size = 128

  tags = {
    Name = "tasktflam"
  }
 }

 resource "aws_lambda_function_url" "test_latest" {
  function_name      = aws_lambda_function.task_lambda.function_name #By accessing .function_name, want to use the function_name attribute of the Lambda function object, which is a string.
  authorization_type = "NONE"
}

/*
Access by IAM 
resource "aws_lambda_function_url" "test_live" {
  function_name      = aws_lambda_function.test.task_lambda
  qualifier          = "my_alias"
  authorization_type = "AWS_IAM"

  cors {
    allow_credentials = true
    allow_origins     = ["*"]
    allow_methods     = ["*"]
    allow_headers     = ["date", "keep-alive"]
    expose_headers    = ["keep-alive", "date"]
    max_age           = 86400
  }
}
*/
output "function_url" {
  value = aws_lambda_function_url.test_latest.function_url
}