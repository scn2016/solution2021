# Terraform configuration
terraform {
  required_version = "= 0.12.31"
}

# AWS Provider Setup
provider "aws" {
  version = "= 3.12.0"
  region  = "us-east-1"
}

