resource "aws_route_table" "route_tables" {
    count = length(var.rt_names)
    vpc_id = var.vpc_id
    tags = {
        Name = var.rt_names[count.index]
    }
}

output "route_table_id" {
    value = aws_route_table.route_tables[*].id
}