data "aws_subnet" "subnet_name" {
    count = length(var.subnet_name_association)
    filter {
        name   = "tag:Name"
        values = [var.subnet_name_association[count.index]]
    }
}

data "aws_route_table" "route_table_name" {
  count = length(var.route_table_name_association)
    filter {
        name   = "tag:Name"
        values = [var.route_table_name_association[count.index]]
    }
}