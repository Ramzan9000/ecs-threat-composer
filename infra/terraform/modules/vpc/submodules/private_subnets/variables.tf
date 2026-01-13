variable "vpc_id" {
  type        = string
  description = "The VPC ID where subnets will be created"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet CIDRs"
}

variable "vpc_name" {
  type        = string
  description = "VPC name for tagging"
}
