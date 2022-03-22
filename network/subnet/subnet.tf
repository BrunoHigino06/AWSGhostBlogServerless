# ALB Subnet

resource "aws_subnet" "ALBSubnet1" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "ALBSubnet1"
  }
}

output "ALBSubnet1_ID" {
  value = aws_subnet.ALBSubnet1.id
}

output "ALBSubnet1_CIDR" {
  value = aws_subnet.ALBSubnet1.cidr_block
}

resource "aws_subnet" "ALBSubnet2" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "ALBSubnet2"
  }
}

output "ALBSubnet2_ID" {
  value = aws_subnet.ALBSubnet2.id
}

output "ALBSubnet2_CIDR" {
  value = aws_subnet.ALBSubnet2.cidr_block
}

# FrontEnd Subnet

resource "aws_subnet" "FrontEndSubnet1" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "FrontEndSubnet1"
  }
}

output "FrontEndSubnet1_ID" {
  value = aws_subnet.FrontEndSubnet1.id
}

output "FrontEndSubnet1_CIDR" {
  value = aws_subnet.FrontEndSubnet1.cidr_block
}

resource "aws_subnet" "FrontEndSubnet2" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "FrontEndSubnet2"
  }
}

output "FrontEndSubnet2_ID" {
  value = aws_subnet.FrontEndSubnet2.id
}

output "FrontEndSubnet2_CIDR" {
  value = aws_subnet.FrontEndSubnet2.cidr_block
}

# DataBase Subnet

resource "aws_subnet" "DataBaseSubnet1" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.5.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "DataBaseSubnet1"
  }
}

output "DataBaseSubnet1_ID" {
  value = aws_subnet.DataBaseSubnet1.id
}

output "DataBaseSubnet1_CIDR" {
  value = aws_subnet.DataBaseSubnet1.cidr_block
}

resource "aws_subnet" "DataBaseSubnet2" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.6.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "DataBaseSubnet2"
  }
}

output "DataBaseSubnet2_ID" {
  value = aws_subnet.DataBaseSubnet2.id
}

output "DataBaseSubnet2_CIDR" {
  value = aws_subnet.DataBaseSubnet2.cidr_block
}