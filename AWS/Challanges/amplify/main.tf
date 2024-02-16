resource "aws_amplify_app" "frontend-app" {
  for_each    = var.enable_amplify_frontend_create != null ? { create = true } : {}
  name        = "your-app-name"
  repository  = "your-bitbucket-frontend-repository"
  oauth_token = "your-bitbucket-oauth-token"

  #iam_service_role_arn = aws_iam_role.amplify_frontend_role["create"].arn
}