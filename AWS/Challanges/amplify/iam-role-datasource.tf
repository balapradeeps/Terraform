data aws_iam_policy_document assume_role {
  for_each = var.enable_amplify_frontend_create != null ? { create = true } : {}
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["amplify.amazonaws.com"]
    }
  }
}