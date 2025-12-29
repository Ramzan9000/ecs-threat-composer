variable "vpc_id" {
  description = "VPC ID where the security groups will be created"
  type        = string
}

variable "project_name" {
  description = "Project name prefix for resources"
  type        = string
}

variable "allowed_ingress_cidrs" {
  description = "List of CIDRs allowed to access resources"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
