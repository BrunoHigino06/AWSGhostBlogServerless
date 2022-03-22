# Route Table

# ALB route table
resource "aws_route_table" "ALBRT" {
  vpc_id = var.vpc_id

  tags = {
    Name = "ALBRT"
  }
}

resource "aws_route_table_association" "ALBRTAs1" {
  subnet_id      = var.ALBSubnet1_ID
  route_table_id = aws_route_table.ALBRT.id
}

resource "aws_route_table_association" "ALBRTAs2" {
  subnet_id      = var.ALBSubnet2_ID
  route_table_id = aws_route_table.ALBRT.id
}



# FrontEnd route table
resource "aws_route_table" "FrontEndRT" {
  vpc_id = var.vpc_id

  tags = {
    Name = "FrontEndRT"
  }
}

resource "aws_route_table_association" "FrontEndRTAs1" {
  subnet_id      = var.FrontEndSubnet1_ID
  route_table_id = aws_route_table.FrontEndRT.id
}

resource "aws_route_table_association" "FrontEndRTAs2" {
  subnet_id      = var.FrontEndSubnet2_ID
  route_table_id = aws_route_table.FrontEndRT.id
}


# Database route table
resource "aws_route_table" "DatabaseRT" {
  vpc_id = var.vpc_id

  tags = {
    Name = "DatabaseRT"
  }
}

resource "aws_route_table_association" "DatabaseRTAs1" {
  subnet_id      = var.DatabaseSubnet1_ID
  route_table_id = aws_route_table.DatabaseRT.id
}

resource "aws_route_table_association" "DatabaseRTAs2" {
  subnet_id      = var.DatabaseSubnet2_ID
  route_table_id = aws_route_table.DatabaseRT.id
}

# Route Table Routes

# ALB Routes

# Route for internet
resource "aws_route" "ToInternet" {
  route_table_id = aws_route_table.ALBRT.id
  gateway_id = var.InternetGateway_ID
  destination_cidr_block = "0.0.0.0/0"

  depends_on = [
    aws_route_table.ALBRT
  ]
}