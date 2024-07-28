######################################################################################################################################
#                                                     Creating VPC
######################################################################################################################################
resource "aws_vpc" "Recover-access-to-lost-keypair" {
  cidr_block = var.vpc-cidr
  tags = {
    Name = "Recover-access-to-lost-keypair"
  }
}

######################################################################################################################################
#                                                   Creating Subnet
######################################################################################################################################
resource "aws_subnet" "public-subnet" {
  vpc_id = aws_vpc.Recover-access-to-lost-keypair.id
  cidr_block = var.public-subnet-cidr
  availability_zone = var.az1
  tags = {
    Name = "Recover-access-to-lost-keypair-Public-subnet"
  }
}

######################################################################################################################################
#                                              Creating Internet Gateway
######################################################################################################################################
resource "aws_internet_gateway" "Recover-access-to-lost-keypair-igw" {
  vpc_id = aws_vpc.Recover-access-to-lost-keypair.id
  tags = {
    Name = "Recover-access-to-lost-keypair-IGW"
  }
}

######################################################################################################################################
#                                              Creating Route Table
######################################################################################################################################
resource "aws_route_table" "Recover-access-to-lost-keypair-RT" {
  vpc_id = aws_vpc.Recover-access-to-lost-keypair.id
  route {
    gateway_id = aws_internet_gateway.Recover-access-to-lost-keypair-igw.id
    cidr_block = "0.0.0.0/0"
  }
  tags = {
    Name = "Recover-access-to-lost-keypair-RT"
  }
}

######################################################################################################################################
#                                           Creating Route Table Association
######################################################################################################################################
resource "aws_route_table_association" "public-subnet" {
  route_table_id = aws_route_table.Recover-access-to-lost-keypair-RT.id
  subnet_id = aws_subnet.public-subnet.id
}