data "aws_subnet" "filter_subnet_id" {
    count = length(var.subnet_name_association)
    filter {
        name = "tag:Name"
        values = var.subnet_name_association[count.index]
    }
}

locals {
    description = "id's to associate with route table"
    subnet_ids = aws_subnet.filter_subnet_id[*].id
}

data "aws_route_table" "filter_route_table_id" {
    count = length(var.route_table_name_association)
        filter {
            name = "tag:Name"
            values = var.route_table_name_association[count.index]
        }
}

locals {
    description = "id's to associate with subnets"
    route_table_id = aws_route_table.filter_route_table_id[*].Id
}

resource "aws_route_table_association" "aws_route_table_association" {
    count = length(var.subnet_name_association)
    subnet_id = local.subnet_ids[count.index]
    route_table_id = local.route_table_id[count.index]

    depends_on = [
      data.aws_route_table.filter_route_table_id,
      data.aws_subnet.filter_subnet_id
    ]
}