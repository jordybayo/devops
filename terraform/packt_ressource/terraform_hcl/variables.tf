provider "aws" {
  region = "us-east-1"
}

variable "bucket_name" {
  description = "Bucket for s3"
}

# local are customisable type
locals {
  bucket_name   = "jordy-bayo-s3-very-first-bucket"
  instance_name = "packt-ec2-instance"
  instance_type = "t2.micro"
}

resource "aws_s3_bucket" "variable_s3_bucket" {
  # interpolation
  bucket = "${var.bucket_name}-jordy-bucket"
  # interpolation with logical statement
  # bucket = var.bucket_name == "" ? "jordy-bucket" : var.bucket_name

  ami           = "ami-0a9b9f3d"
  instance_type = local.instance_type

  tags = {
    Name = local.instance_name
  }
}
