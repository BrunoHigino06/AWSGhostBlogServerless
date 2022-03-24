resource "aws_subnet" "subnets" {
  for_each = var.subnets
 
  availability_zone = each.value["az"]
  cidr_block = each.value["cidr"]
  vpc_id     = var.vpc_id

  tags = {
    Name = each.value["name"]
  }
}