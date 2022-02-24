# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
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




