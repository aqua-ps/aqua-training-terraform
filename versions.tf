terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.65.0" # any 4.65.y, but not 4.66 or 5/6
    }
  }
}
