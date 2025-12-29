variable "vpc_name" {
  type        = string
  description = "Name of the VPC for tagging purposes"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public subnet IDs where NAT Gateway can be placed"
}
