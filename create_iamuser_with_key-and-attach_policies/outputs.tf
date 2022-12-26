output name {
  value = aws_iam_user.this.name
}

output arn {
  value = aws_iam_user.this.arn
}

output aws_access_key_id {
  value     = var.cli ? aws_iam_access_key.this["create"].id : null
  sensitive = true
}

output aws_secret_access_key {
  value     = var.cli ? aws_iam_access_key.this["create"].secret : null
  sensitive = true
}
