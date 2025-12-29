variable "vpc_id" {
  type        = string
  description = "The VPC ID"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public subnet IDs"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs"
}

variable "internet_gateway_id" {
  type        = string
  description = "ID of the Internet Gateway"
}

variable "nat_gateway_id" {
  type        = string
  description = "ID of the NAT Gateway"
}

variable "vpc_name" {
  type        = string
  description = "VPC name for tagging"
}
