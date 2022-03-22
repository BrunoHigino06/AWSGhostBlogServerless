# Route Table

# Public route table
resource "aws_route_table" "PublicRT" {
  vpc_id = var.vpc_id

  tags = {
    Name = "PublicRT"
  }
}

resource "aws_route_table_association" "PublicRTAs1" {
  subnet_id      = var.ALBSubnet1_ID
  route_table_id = aws_route_table.PublicRT.id
}

resource "aws_route_table_association" "PublicRTs2" {
  subnet_id      = var.ALBSubnet2_ID
  route_table_id = aws_route_table.PublicRT.id
}



# Private route table
resource "aws_route_table" "PrivateRT" {
  vpc_id = var.vpc_id

  tags = {
    Name = "PrivateRT"
  }
}

resource "aws_route_table_association" "FrontEndSubnet1As" {
  subnet_id      = var.FrontEndSubnet1_ID
  route_table_id = aws_route_table.PrivateRT.id
}

resource "aws_route_table_association" "FrontEndSubnet2As" {
  subnet_id      = var.FrontEndSubnet2_ID
  route_table_id = aws_route_table.PrivateRT.id
}

resource "aws_route_table_association" "DatabaseSubnet1As" {
  subnet_id      = var.DatabaseSubnet1_ID
  route_table_id = aws_route_table.PrivateRT.id
}

resource "aws_route_table_association" "DatabaseSubnet2As" {
  subnet_id      = var.DatabaseSubnet2_ID
  route_table_id = aws_route_table.PrivateRT.id
}

# Route Table Routes

# Public Routes

# Route for internet
resource "aws_route" "ToInternet" {
  route_table_id = aws_route_table.PublicRT.id
  gateway_id = var.InternetGateway_ID
  destination_cidr_block = "0.0.0.0/0"

  depends_on = [
    aws_route_table.PublicRT
  ]
}