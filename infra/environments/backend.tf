terraform {
  required_version = ">= 1.5.0"

  backend "s3" {
    bucket         = "devsecops-demo-tfstate-541446547501"
    region         = "us-east-1"
    dynamodb_table = "devsecops-demo-tf-lock"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}