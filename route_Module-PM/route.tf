#provider information
provider "aws" {
  region     = "us-east-1"

}

#vpc creation

resource "aws_vpc" "amazonvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    name = "amazon"
  }
}
#creating IGW
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.amazonvpc.id
}
# Create a subnet
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.amazonvpc.id
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "subnet"
  }
}

#creating security group
resource "aws_security_group" "allow_ssh" {
  vpc_id = aws_vpc.amazonvpc.id
}

#creating routetable
resource "aws_route_table" "route-public" {
  vpc_id = aws_vpc.amazonvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }

  tags = {
    Name = "public-route-table-demo"
  }
}

resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.route-public.id
}


  
