resource "aws_subnet" "private" {
  count = length(var.private_subnets)

  vpc_id = var.vpc_id
  cidr_block = var.private_subnets[count.index]

  tags = {
    Name = "${var.vpc_name}-private-${count.index}"
  }
}

