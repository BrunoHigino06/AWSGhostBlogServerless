module "vpc" {
  source = "git::https://github.com/BrunoHigino06/aws_vpc_module.git"

  vpc = {
    Name = var.vpc.Name
    cidr_block = var.vpc.cidr_block
  }
}

module "subnet" {
  source = "git::https://github.com/BrunoHigino06/aws_subnet_module.git"

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
  source = "git::https://github.com/BrunoHigino06/aws_route_table_module.git"

  # VPC ID
  vpc_id = module.vpc.vpc_id

  #RouteTable Names
  rt_names = var.rt_names

  depends_on = [
    module.subnet,
    module.vpc
  ]
}

module "PublicRouteTableAssociation" {
  source = "git::https://github.com/BrunoHigino06/aws_route_table_association_module.git"

  #Subnet name to associate with public route table
  subnet_name_association = var.subnet_name_association
  #Route table name to associate with the subnets
  route_table_name_association = var.route_table_name_association

  depends_on = [
    module.vpc,
    module.subnet,
    module.RouteTable
  ]
}