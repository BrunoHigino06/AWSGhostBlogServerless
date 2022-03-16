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

  depends_on = [
    module.vpc,
    module.subnet
  ]
}
