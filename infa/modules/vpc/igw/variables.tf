variable "vpc_id" {
  type        = string
  description = "The ID of the VPC to attach the Internet Gateway to"
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC for tagging the IGW"
}
