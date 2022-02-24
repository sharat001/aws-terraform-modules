# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAWI7TGBPHBVNDQAN7"
  secret_key = "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"
}

# Create a VPC
resource "aws_vpc" "amazonvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "amazon"
  }
}
# Creating Internet Gateway
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.amazonvpc.id
}

resource "aws_default_security_group" "allow_ssh" {
  vpc_id = aws_vpc.amazonvpc.id

  ingress {
    protocol    = "tcp"
    self        = true
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
