provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "terraform-state-tap"
    key    = "tap"
    region = "eu-west-2"
  }
}