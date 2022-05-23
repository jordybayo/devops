terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.14"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  alias = "aws.virginia"
  region = "us-east-1"
  access_key = "AKIA3SPCUNNF6NKNWS42"
  secret_key = "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"
}

resource "aws_s3_bucket" "my_very_first_bucket" {
  # provider = "aws.virginia"
  bucket = "jordy-bayo-s3-very-first-bucket"

}