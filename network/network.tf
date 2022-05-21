module "vpc" {
  source = ""

  vpc = {
    Name = var.vpc.Name
    cidr_block = var.vpc.cidr_block
  }
}

module "subnet" {
  source = ""

  # VPC ID
  vpc_id = module.vpc.vpc_id

  #SubnetConfiguration
  subnets_names      = var.subnets_names
  subnets_cidr_block = var.subnets_cidr_block
  subnet_az          = var.subnet_az

  depends_on = [
    module.vpc
  ]
}

module "RouteTable" {
  source = ""

  # VPC ID
  vpc_id = module.vpc.vpc_id

  #RouteTable Names
  rt_names = ["Public", "Private"]

  depends_on = [
    module.subnet,
    module.vpc
  ]
}

module "PublicRouteTableAssociation" {
  source = ""

  #Subnet name to associate with public route table
  subnet_name_association = ["Alb1", "Alb2", "Alb3", "FrontEnd1", "FrontEnd2", "FrontEnd3", "DataBase1", "DataBase2", "DataBase3"]
  #Route table name to associate with the subnets
  route_table_name_association = ["Public", "Public", "Public", "Private", "Private", "Private", "Private", "Private", "Private"]

  depends_on = [
    module.vpc,
    module.subnet,
    module.RouteTable
  ]
}