# VPC
resource "aws_vpc" "GhostVPC" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    "Name" = "GhostVPC"
  }
}

output "aws_vpc_GhostVPC_ID_output" {
  value = aws_vpc.GhostVPC.id
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

output "GhostIGW_ID" {
  value = aws_internet_gateway.GhostIGW.id
}