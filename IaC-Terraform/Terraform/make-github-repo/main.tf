provider "github" {
  token = var.github_token
}

resource "github_repository" "my_repo" {
  name        = "${var.name_prefix}repo"
  description = "My Terraform-managed repo"

  visibility = "public" # or "private"

  auto_init = true
}