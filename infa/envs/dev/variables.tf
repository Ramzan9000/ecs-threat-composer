
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


# ----------------------
# Security groups
# ----------------------

variable "project_name" {
  description = "Project name prefix for resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where Security Groups will be created"
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


variable "aws_region" {}

# ECS Cluster
variable "cluster_name" {}

# ECS Task Definition
variable "task_name" {}
variable "container_definitions" {}
variable "cpu" {}
variable "memory" {}
variable "execution_role_arn" {}
variable "task_role_arn" {}

# ECS Service
variable "service_name" {}
variable "desired_count" {}
variable "subnet_ids" {
  type = list(string)
}
variable "security_group_ids" {
  type = list(string)
}
variable "target_group_arn" {}
variable "container_name" {}
variable "container_port" {}




# ----------------------
# alb
# ----------------------

variable "alb_name" {}
variable "alb_security_group_ids" {
  type = list(string)
}
variable "public_subnet_ids" {
  type = list(string)
}

variable "target_group_name" {}
variable "target_group_port" {}
variable "target_group_protocol" {}
variable "listener_port" {}
variable "listener_protocol" {}





# ----------------------
#  acm
# ----------------------

variable "domain_name" {}
variable "zone_id" {}
variable "record_name" {}
variable "ttl" {
  default = 300
}

# ----------------------
# route53
# ----------------------

variable "alb_dns_name" {}
variable "tags" {
  type = map(string)
  default = {}
}