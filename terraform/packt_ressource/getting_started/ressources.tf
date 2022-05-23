provider "aws" {
  region = "us-east-1"
  access_key = "AKIA3SPCUNNF6NKNWS42"
  secret_key = "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"
}

resource "aws_instance" "ec2_instance" {
  ami = "ami-0a9b9f3d"
  instance_type = "t2.micro"
  tags = {
    Name = "packt-ec2-instance"
  }

  # key_name = data.aws_instance.ec2_data.key_name
}
  
# data "aws_instance" "ec2_data" {
#   instance_id = "${aws_instance.ec2_instance.id}"
# }