resource "aws_subnet" "subnets" {
    for_each          = var.subnets
    vpc_id            = var.vpc_id
    cidr_block        = each.value["cidr_block"]
    availability_zone = each.value["az"]

    tags = {
        Name = each.value["name"]
    }
}

output "subnets_id" {
  
}