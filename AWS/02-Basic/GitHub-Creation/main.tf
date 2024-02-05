resource "github_repository" "example" {
  name        = "CreateRepoFromTerraformBPS"
  description = "My awesome codebase"

  visibility = "public"
}