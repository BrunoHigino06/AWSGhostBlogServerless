# VPC
resource "aws_vpc" "GhostVPC" {
  cidr_block = var.aws_vpc_GhostVPC.cidr_block
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    "Name" = "GhostVPC"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "GhostIGW" {
  vpc_id = aws_vpc.GhostVPC.id

  tags = {
    "Name" = "GhostIGW"
  }
  depends_on = [
    aws_vpc.GhostVPC
  ]
}

# Load balance network #

# Subnet

resource "aws_subnet" "ELBSubnet" {
  vpc_id     = aws_vpc.GhostVPC.id
  cidr_block = var.aws_subnet_ELBSubnet.cidr_block
  availability_zone = var.aws_subnet_ELBSubnet.availability_zone

  tags = {
    Name = var.aws_subnet_ELBSubnet.Name
  }
  depends_on = [
    aws_vpc.GhostVPC
  ]
}

# Route Table

resource "aws_route_table" "ELBRT" {
  vpc_id = aws_vpc.GhostVPC.id

  tags = {
    Name = var.aws_route_table_ELBRT.Name
  }
  depends_on = [
    aws_vpc.GhostVPC,
    aws_subnet.ELBSubnet
  ]
}

# Route for internet
resource "aws_route" "ToInternet" {
  route_table_id = aws_route_table.ELBRT.id
  gateway_id = aws_internet_gateway.GhostIGW.id
  destination_cidr_block = var.aws_route_ToInternet.destination_cidr_block

  depends_on = [
    aws_route_table.ELBRT,
    aws_internet_gateway.GhostIGW
  ]
}