
# Terraform 0.13 and later (v1.0)
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.29.0"
    }
  }

/*  
   backend "s3" {
     bucket = "test-bucket"
     key = "test/testing-terraform.tfstate"
     region = "us-east-2"
   }
*/   
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
  #profile = "default"
}
