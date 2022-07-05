#Networking vars
#VPC vars
variable "vpc" {
 type = map(any)
  default = {
    Name  = ""
    cidr_block = ""
  }
}

#Subnet vars
variable "subnets_names" {
  type = list(string)
  description = "Name of the subnets"
}

variable "subnets_cidr_block" {
    type = list(string)
    description = "List of cidr blocks of public subnets"
}

variable "subnet_az" {
    type = list(string)
    description = "List of cidr blocks of public subnets"
}

#Route Table vars
variable "rt_names" {
    type = list(string)
    description = "Name of the Route Tables"
}

# Route Table Association vars
variable "RTsubnet_name_association" {
  type = list(string)
  description = "Names of the subnets to associate with a route table"
}

variable "route_table_name_association" {
  type = list(string)
  description = "name of the route tables to association with the subnets"
}

#Network ACL vars
variable "network_acl_name" {
    type = list(string)
    description = "Name of the Network ACL's"
}

#Network ACL Association vars
variable "ACLsubnet_name_association" {
  type = list(string)
  description = "Names of the subnets to associate with a network acl"
}

variable "networkAcl_name_association" {
  type = list(string)
  description = "name of the network acl to association with the subnets"
}