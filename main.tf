module "network" {
  source = ".\\network\\"
  providers = {
    aws = aws.us
  }

  # VPC inputs
  vpc = {
    Name = var.vpc.Name
    cidr_block = var.vpc.cidr_block
  }

  #Subnet Inputs
  subnets_names      = var.subnets_names
  subnets_cidr_block = var.subnets_cidr_block
  subnet_az          = var.subnet_az
}