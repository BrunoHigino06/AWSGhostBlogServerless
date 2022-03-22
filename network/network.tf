module "vpc" {
  source = ".\\vpc\\"
}

module "subnet" {
  source = ".\\subnet\\"

  # VPC_ID
  vpc_id = module.vpc.aws_vpc_GhostVPC_ID_output

  depends_on = [
    module.vpc
  ]
}

module "routetable" {
  source = ".\\routetable\\"

  # Route Table 
  vpc_id = module.vpc.aws_vpc_GhostVPC_ID_output

  # Subnet association
  ALBSubnet1_ID = module.subnet.ALBSubnet1_ID
  ALBSubnet2_ID = module.subnet.ALBSubnet2_ID
  FrontEndSubnet1_ID = module.subnet.FrontEndSubnet1_ID
  FrontEndSubnet2_ID = module.subnet.FrontEndSubnet2_ID
  DatabaseSubnet1_ID = module.subnet.DataBaseSubnet1_ID
  DatabaseSubnet2_ID = module.subnet.DataBaseSubnet2_ID
  InternetGateway_ID = module.vpc.GhostIGW_ID

  depends_on = [
    module.vpc,
    module.subnet
  ]
}

module "securitygroup" {
  source = ".\\securitygroup\\"
  
  # Security Group
  vpc_id = module.vpc.aws_vpc_GhostVPC_ID_output

  # Security Group rules
  ALBSubnet1_CIDR = module.subnet.ALBSubnet1_CIDR
  ALBSubnet2_CIDR = module.subnet.ALBSubnet2_CIDR
  FrontEndSubnet1_CIDR = module.subnet.FrontEndSubnet1_CIDR
  FrontEndSubnet2_CIDR = module.subnet.FrontEndSubnet2_CIDR
  DataBaseSubnet1_CIDR = module.subnet.DataBaseSubnet1_CIDR
  DataBaseSubnet2_CIDR = module.subnet.DataBaseSubnet2_CIDR

  depends_on = [
    module.vpc,
    module.subnet
  ]
}