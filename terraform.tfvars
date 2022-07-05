#VPC Inputs  
vpc = {
   Name = "CloudProject"
   cidr_block = "10.0.0.0/16"
}

#Subnet Inputs
subnets_names      = ["Alb1", "Alb2", "FrontEnd1", "FrontEnd2", "DataBase1", "DataBase2"]
subnets_cidr_block = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
subnet_az          = ["us-east-1a", "us-east-1b", "us-east-1a", "us-east-1b", "us-east-1a", "us-east-1b"]

#Route Table inputs
rt_names = ["PublicRT", "PrivateRT"]

#Route Table Association inputs
RTsubnet_name_association = ["Alb1", "Alb2", "FrontEnd1", "FrontEnd2", "DataBase1", "DataBase2"]
route_table_name_association = ["PublicRT", "PublicRT", "PrivateRT", "PrivateRT", "PrivateRT", "PrivateRT"]

#NetWork ACL inputs
network_acl_name = ["PublicACL", "PrivateACL"]

#Network ACL Association input
ACLsubnet_name_association = ["Alb1", "Alb2", "FrontEnd1", "FrontEnd2", "DataBase1", "DataBase2"]
networkAcl_name_association = ["PublicACL", "PublicACL", "PrivateACL", "PrivateACL", "PrivateACL", "PrivateACL"]
