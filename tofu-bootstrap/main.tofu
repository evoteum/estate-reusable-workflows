terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
    github = {
      source  = "integrations/github"
      version = "5.45.0"
    }
  }
  required_version = "1.9.0"
  backend "s3" {
    # These values will be provided by -backend-config in CI
    bucket = ""
    key    = ""
    region = ""
  }
}

resource "null_resource" "init" {
  provisioner "local-exec" {
    command = "echo State file created"
  }
}
