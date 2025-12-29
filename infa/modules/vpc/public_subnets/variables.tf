variable "vpc_id" {
  type        = string
  description = "The VPC ID where subnets will be created"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnet CIDRs"
}

variable "vpc_name" {
  type        = string
  description = "VPC name for tagging"
}
