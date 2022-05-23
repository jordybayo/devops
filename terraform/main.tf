provider "aws" {
  region = "eu-east-1"
}

module "vpc_module" {
  source = "./modules/vpc_networking"
  
}