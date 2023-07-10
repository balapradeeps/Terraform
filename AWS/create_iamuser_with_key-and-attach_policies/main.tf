resource aws_iam_user this {
  name = var.name
  tags = var.tags

  force_destroy = true
}

resource aws_iam_access_key this {
  for_each = var.cli ? { create = true } : {}

  user = aws_iam_user.this.name
}

resource "aws_iam_user_policy_attachment" "s3_bucket_policy_for_IAM_user" {
  user       = aws_iam_user.this.name
  policy_arn = aws_iam_policy.s3_bucket_policy.arn
}

resource "aws_iam_user_policy_attachment" "ec2-user-full" {
  user       = aws_iam_user.this.name
  policy_arn = aws_iam_policy.ec2_full.arn
}
