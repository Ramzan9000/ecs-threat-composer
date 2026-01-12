# ----------------------
# VPC
# ----------------------

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnet CIDRs"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet CIDRs"
}

variable "vpc_name" {
  type        = string
  description = "VPC name for tagging"
}

variable "aws_region" {
  type        = string
  description = "VPC region for dev"
}

# ----------------------
# Security groups
# ----------------------

variable "project_name" {
  description = "Project name prefix for resources"
  type        = string
}



variable "allowed_ingress_cidrs" {
  description = "CIDRs allowed to access ALB and ECS tasks"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}


# ----------------------
# IAM
# ----------------------

variable "alb_role_name" {}
variable "ecs_execution_role_name" {}
variable "ecs_task_role_name" {}



# ----------------------
# ecr
# ----------------------

variable "ecr_repository_name" {
  description = "Name of the ECR repository for this environment"
  type        = string
}

variable "tags" {
  description = "Tags for resources in this environment"
  type        = map(string)
  default     = {}
}



# ----------------------
# ecs
# ----------------------


# ECS Cluster
variable "cluster_name" {}

# ECS Task Definition
variable "task_name" {}
variable "cpu" {}
variable "memory" {}
variable "container_image" {}

# ECS Service
variable "service_name" {}
variable "desired_count" {}
variable "ecs_launch_type" {}
variable "container_name" {}
variable "container_port" {}





# ----------------------
# alb
# ----------------------

variable "alb_name" {
  type = string
}

variable "alb_target_group_name" {
  type = string
}

variable "alb_target_group_port" {
  type = number
}

variable "alb_target_group_protocol" {
  type = string
}

variable "alb_listener_http_port" {
  type = number
}

variable "alb_listener_http_protocol" {
  type = string
}


# ----------------------
#  acm 
# ----------------------

variable "domain_name" {
  description = "Domain name for ACM certificate"
  type        = string
  default     = null
}

# ----------------------
# route53
# ----------------------


variable "zone_id" {
  description = "Existing Route53 hosted zone ID"
  type        = string
  default     = null
}

variable "record_name" {
  description = "DNS record name (e.g. www.example.com)"
  type        = string
  default     = null
}

# TTL for Route53 record
variable "ttl" {
  type    = number
  default = 300
}

# ALB Zone ID for Route53 alias
variable "alb_zone_id" {
  type    = string
  default = ""
}

variable "alb_dns_name" {
  type    = string
  default = ""
  description = "DNS name of the ALB (for Route53 alias record)"
}
