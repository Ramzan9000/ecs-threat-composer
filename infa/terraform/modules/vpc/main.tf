# Create the VPC itself
resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = { Name = var.vpc_name }
}

# Call Public Subnets submodule
module "public_subnets" {
  source         = "./submodules/public_subnets"
  vpc_id         = aws_vpc.this.id
  vpc_name       = var.vpc_name
  public_subnets = var.public_subnets
}

# Call Private Subnets submodule
module "private_subnets" {
  source          = "./submodules/private_subnets"
  vpc_id          = aws_vpc.this.id
  vpc_name        = var.vpc_name
  private_subnets = var.private_subnets
}

# Call Internet Gateway submodule
module "internet_gateway" {
  source = "./submodules/internet_gateway"
  vpc_name = var.vpc_name
  vpc_id = aws_vpc.this.id
}

# Call NAT Gateway submodule
module "nat_gateway" {
  source           = "./submodules/nat_gateway"
  vpc_name         = var.vpc_name           
  public_subnet_ids = module.public_subnets.ids
}

# Call Route Tables submodule
module "route_tables" {
  source           = "./submodules/route_tables"
  vpc_id           = aws_vpc.this.id
  vpc_name         = var.vpc_name
  public_subnet_ids  = module.public_subnets.ids
  private_subnet_ids = module.private_subnets.ids
  nat_gateway_id   = module.nat_gateway.id
  internet_gateway_id = module.internet_gateway.id
}
