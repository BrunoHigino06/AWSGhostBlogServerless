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