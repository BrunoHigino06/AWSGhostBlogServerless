output "subnet_ids" {
    description = "subnets id"
    value = aws_subnet.subnets[*].id

    depends_on = [
      aws_subnet.subnets
    ]
}

output "subnet_cidrblocks" {
    description = "cidr blocks of the subnets"
    value = aws_subnet.subnets[*].cidr_block

    depends_on = [
      aws_subnet.subnets
    ]
}