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