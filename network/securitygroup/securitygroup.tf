# Security Groups

# FrontEnd SG
resource "aws_security_group" "FrontEndSG" {
  vpc_id = var.vpc_id
  name = "FrontEndSG"
  description = "Security group for the FrontEnd"
  tags = {
    Name = "FrontEndSG"
  }
}

# FrontEnd SG Rules

# Ingress

# Allow ALB ingress
resource "aws_security_group_rule" "FrontendINALB1" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = [var.ALBSubnet1_CIDR]
  security_group_id = aws_security_group.FrontEndSG.id

  depends_on = [
    aws_security_group.FrontEndSG
  ]
}

resource "aws_security_group_rule" "FrontendINALB2" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = [var.ALBSubnet2_CIDR]
  security_group_id = aws_security_group.FrontEndSG.id

  depends_on = [
    aws_security_group.FrontEndSG
  ]
}

# Allow DB Ingress
resource "aws_security_group_rule" "FrontendINDb1" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = [var.DataBaseSubnet1_CIDR]
  security_group_id = aws_security_group.FrontEndSG.id

  depends_on = [
    aws_security_group.FrontEndSG
  ]
}

resource "aws_security_group_rule" "FrontendINDB2" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = [var.DataBaseSubnet2_CIDR]
  security_group_id = aws_security_group.FrontEndSG.id

  depends_on = [
    aws_security_group.FrontEndSG
  ]
}


# Egress

# Allow ALB egress
resource "aws_security_group_rule" "FrontendEGALB1" {
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = [var.ALBSubnet1_CIDR]
  security_group_id = aws_security_group.FrontEndSG.id

  depends_on = [
    aws_security_group.FrontEndSG
  ]
}

resource "aws_security_group_rule" "FrontendEGALB2" {
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = [var.ALBSubnet2_CIDR]
  security_group_id = aws_security_group.FrontEndSG.id

  depends_on = [
    aws_security_group.FrontEndSG
  ]
}

# Allow DB egress
resource "aws_security_group_rule" "FrontendEGBD1" {
  type              = "egress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = [var.DataBaseSubnet1_CIDR]
  security_group_id = aws_security_group.FrontEndSG.id

  depends_on = [
    aws_security_group.FrontEndSG
  ]
}

resource "aws_security_group_rule" "FrontendEGBD2" {
  type              = "egress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = [var.DataBaseSubnet2_CIDR]
  security_group_id = aws_security_group.FrontEndSG.id

  depends_on = [
    aws_security_group.FrontEndSG
  ]
}


# Database SG
resource "aws_security_group" "DatabaseSG" {
  vpc_id = var.vpc_id
  name = "DatabaseSG"
  description = "Security group for the FrontEnd"
  tags = {
    Name = "DatabaseSG"
  }
}

# Database SG Rules

# Ingress

# Allow frontend ingress
resource "aws_security_group_rule" "DatabaseINFrontend1" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = [var.FrontEndSubnet1_CIDR]
  security_group_id = aws_security_group.DatabaseSG.id

  depends_on = [
    aws_security_group.DatabaseSG
  ]
}

resource "aws_security_group_rule" "DatabaseINFrontend2" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = [var.FrontEndSubnet2_CIDR]
  security_group_id = aws_security_group.DatabaseSG.id

  depends_on = [
    aws_security_group.DatabaseSG
  ]
}

# Egress

# Allow frontend egress
resource "aws_security_group_rule" "DatabaseEGFrontend1" {
  type              = "egress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = [var.FrontEndSubnet1_CIDR]
  security_group_id = aws_security_group.DatabaseSG.id

  depends_on = [
    aws_security_group.DatabaseSG
  ]
}

resource "aws_security_group_rule" "DatabaseEGFrontend2" {
  type              = "egress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = [var.FrontEndSubnet2_CIDR]
  security_group_id = aws_security_group.DatabaseSG.id

  depends_on = [
    aws_security_group.DatabaseSG
  ]
}