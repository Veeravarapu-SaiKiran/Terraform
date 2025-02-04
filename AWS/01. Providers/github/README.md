# GitHub Provider
The GitHub provider is used to interact with GitHub resources.

The provider allows you to manage your GitHub organization's members and teams easily. It needs to be configured with the proper credentials before it can be used.

```
resource "github_repository" "example" {
  name        = "github_repository_creation_through_terraform"
  description = "My awesome codebase"
  visibility = "public"
}
```
