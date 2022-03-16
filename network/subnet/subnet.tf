# SubNets 

# ALB Subnet

resource "aws_subnet" "ALBSubnet1" {
  vpc_id     = aws_vpc.GhostVPC.id
  cidr_block = var.aws_subnet_ALBSubnet.cidr_block1
  availability_zone = var.aws_subnet_ALBSubnet.availability_zone1

  tags = {
    Name = var.aws_subnet_ALBSubnet.Name1
  }
  depends_on = [
    aws_vpc.GhostVPC
  ]
}

resource "aws_subnet" "ALBSubnet2" {
  vpc_id     = aws_vpc.GhostVPC.id
  cidr_block = var.aws_subnet_ALBSubnet.cidr_block2
  availability_zone = var.aws_subnet_ALBSubnet.availability_zone2

  tags = {
    Name = var.aws_subnet_ALBSubnet.Name2
  }
  depends_on = [
    aws_vpc.GhostVPC
  ]
}