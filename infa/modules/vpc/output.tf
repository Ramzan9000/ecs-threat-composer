# VPC ID
output "vpc_id" {
  value       = aws_vpc.this.id
  description = "The ID of the VPC"
}

# Public subnet IDs
output "public_subnet_ids" {
  value       = module.public_subnets.ids
  description = "List of IDs for public subnets"
}

# Private subnet IDs
output "private_subnet_ids" {
  value       = module.private_subnets.ids
  description = "List of IDs for private subnets"
}

# NAT Gateway ID (optional, if only one NAT Gateway)
output "nat_gateway_id" {
  value       = module.nat_gateway.id
  description = "The ID of the NAT Gateway"
}

# Internet Gateway ID
output "internet_gateway_id" {
  value       = module.internet_gateway.id
  description = "The ID of the Internet Gateway"
}
