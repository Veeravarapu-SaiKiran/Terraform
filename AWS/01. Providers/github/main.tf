terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "~> 6.5.0"
    }
  }
}

provider "github" {
    token = "x"
}

resource "github_repository" "example" {
  name        = "github_repository_creation_through_terraform"
  description = "My awesome codebase"
  visibility = "public"
}

output "clone_url" {
    description = "Https clone url: "
    value = github_repository.example.http_clone_url
}