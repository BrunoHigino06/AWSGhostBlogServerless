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

  #Route Table inputs
  rt_names = var.rt_names

  #Route Table Association inputs
  RTsubnet_name_association = var.RTsubnet_name_association
  route_table_name_association = var.route_table_name_association

  #NetWork ACL inputs
  network_acl_name = var.network_acl_name

  #Network ACL Association inputs
  ACLsubnet_name_association = var.ACLsubnet_name_association
  networkAcl_name_association = var.networkAcl_name_association
}
