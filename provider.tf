provider "aws" {
  region = var.my_region
  shared_credentials_file = "~/.aws/credentials"
  profile = "default"
}
