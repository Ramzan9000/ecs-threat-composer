# VPC CIDR block
variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC"
}

# Public subnets CIDRs
variable "public_subnets" {
  type        = list(string)
  description = "List of public subnet CIDR blocks"
}

# Private subnets CIDRs
variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet CIDR blocks"
}

# VPC name for tagging
variable "vpc_name" {
  type        = string
  description = "Name tag for the VPC and subnets"
}
