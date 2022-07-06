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

module "RouteTableAssociation" {
  source = "git::https://github.com/BrunoHigino06/aws_route_table_association_module.git"

  #Subnet name to associate with route table
  subnet_name_association = var.RTsubnet_name_association
  #Route table name to associate with the subnets
  route_table_name_association = var.route_table_name_association

  depends_on = [
    module.vpc,
    module.subnet,
    module.RouteTable
  ]
}

module "NetwrokACL" {
  source = "git::https://github.com/BrunoHigino06/aws_Network_ACL_module.git"

  # VPC ID
  vpc_id = module.vpc.vpc_id

  #Netwrok ACL Names
  network_acl_name = var.network_acl_name

  depends_on = [
    module.vpc
  ]
}

resource "aws_network_acl_association" "PublicACL" {
  count = length(var.Pubsubnet_name_association)
  network_acl_id = module.NetwrokACL.acl_id[0]
  subnet_id      = data.aws_subnet.Public_subnet_name[count.index].id
}

resource "aws_network_acl_association" "PrivateACL" {
  count = length(var.Privsubnet_name_association)
  network_acl_id = module.NetwrokACL.acl_id[1]
  subnet_id      = data.aws_subnet.Private_subnet_name[count.index].id
}

