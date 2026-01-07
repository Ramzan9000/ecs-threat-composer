resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "${var.vpc_name}-nat-eip"
  }
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.nat.id
  subnet_id     = var.public_subnet_ids[0]  # attach NAT Gateway to the first public subnet

  tags = {
    Name = "${var.vpc_name}-nat-gateway"
  }

  depends_on = [aws_eip.nat]
}
