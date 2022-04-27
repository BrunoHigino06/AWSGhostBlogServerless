module "vpc" {
  source = "git::https://github.com/BrunoHigino06/terraform_modules.git//aws/network/vpc"

  vpc = {
    Name = "GhostVpc"
    cidr_block = "10.0.0.0/16"
  }
}

module "subnet" {
  source = "git::https://github.com/BrunoHigino06/terraform_modules.git//aws/network/subnet"

  # VPC ID
  vpc_id = module.vpc.vpc_id

  #SubnetConfiguration
  subnets_names      = ["Alb1", "Alb2", "Alb3", "FrontEnd1", "FrontEnd2", "FrontEnd3", "DataBase1", "DataBase2", "DataBase3"]
  subnets_cidr_block = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24", "10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"]
  subnet_az          = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1a", "us-east-1b", "us-east-1c", "us-east-1a", "us-east-1b", "us-east-1c",]

  depends_on = [
    module.vpc
  ]
}

module "RouteTable" {
  source = "git::https://github.com/BrunoHigino06/terraform_modules.git//aws/network/routetable"

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
  source = "git::https://github.com/BrunoHigino06/terraform_modules.git//aws/network/routetableassociation"

  #Subnet name to associate with public route table
  subnet_name_association = ["Alb1", "Alb2", "Alb3"]

  #Route table name to associate with the subnets
  route_table_name_association = ["Public"]

  depends_on = [
    module.vpc,
    module.subnet,
    module.RouteTable
  ]
}

