# Download the provider
# If version is not set, tf always downloads the latest version
# For production, all define the provider version

# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 5.16.0"    # Downloads v5.16.1
#     }
#   }
# }
# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "> 5.13.0"    # Downloads v5.14.0
#     }
#   }
# }