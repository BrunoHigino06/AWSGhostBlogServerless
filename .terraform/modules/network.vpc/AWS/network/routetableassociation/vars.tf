variable "subnet_name_association" {
  type = list(string)
  description = "Names of the subnets to associate with a route table"
}

variable "route_table_name_association" {
  type = list(string)
  description = "Id's of the route tables to association with the subnets"
}