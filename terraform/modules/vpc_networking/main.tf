provider "aws" {
  region = "eu-east-2"
}


resource "aws_vpc" "module_vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.module_vpc.id
  cidr_block = var.public_subnet_cidr
  
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.module_vpc.id
  cidr_block = var.private_subnet_cidr
}