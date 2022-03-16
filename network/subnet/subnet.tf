# ALB Subnet

resource "aws_subnet" "ALBSubnet1" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "ALBSubnet1"
  }
}

resource "aws_subnet" "ALBSubnet2" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "ALBSubnet2"
  }
}

# FrontEnd Subnet

resource "aws_subnet" "FrontEndSubnet1" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "FrontEndSubnet1"
  }
}

resource "aws_subnet" "FrontEndSubnet2" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "FrontEndSubnet2"
  }
}

# DataBase Subnet

resource "aws_subnet" "DataBaseSubnet1" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "DataBaseSubnet1"
  }
}

resource "aws_subnet" "DataBaseSubnet2" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "DataBaseSubnet2"
  }
}