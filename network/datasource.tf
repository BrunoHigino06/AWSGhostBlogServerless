data "aws_subnet" "Public_subnet_name" {
    count = length(var.Pubsubnet_name_association)
    filter {
        name   = "tag:Name"
        values = [var.Pubsubnet_name_association[count.index]]
    }
    depends_on = [
      module.subnet
    ]
}

data "aws_subnet" "Private_subnet_name" {
    count = length(var.Privsubnet_name_association)
    filter {
        name   = "tag:Name"
        values = [var.Privsubnet_name_association[count.index]]
    }
    depends_on = [
      module.subnet
    ]
}