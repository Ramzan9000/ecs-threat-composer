

# ----------------------
# VPC
# ----------------------

output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The ID of the created VPC"
}

output "public_subnet_ids" {
  value       = module.vpc.public_subnet_ids
  description = "IDs of the public subnets"
}

output "private_subnet_ids" {
  value       = module.vpc.private_subnet_ids
  description = "IDs of the private subnets"
}

output "internet_gateway_id" {
  value       = module.vpc.internet_gateway_id
  description = "The ID of the Internet Gateway"
}

output "nat_gateway_id" {
  value       = module.vpc.nat_gateway_id
  description = "The ID of the NAT Gateway"
}

output "public_route_table_id" {
  value       = module.vpc.public_route_table_id
  description = "The ID of the public route table"
}

output "private_route_table_id" {
  value       = module.vpc.private_route_table_id
  description = "The ID of the private route table"
}


# ----------------------
# Security groups
# ----------------------


# Outputs from the Security Groups module

output "ecs_tasks_sg_id" {
  description = "Security Group ID for ECS tasks"
  value       = module.security_groups.ecs_tasks_sg_id
}

output "alb_sg_id" {
  description = "Security Group ID for the ALB"
  value       = module.security_groups.alb_sg_id
}


# ----------------------
# IAM
# ----------------------

output "alb_role_arn" {
  value = module.iam.alb_role_arn
}

output "ecs_execution_role_arn" {
  value = module.iam.ecs_execution_role_arn
}

output "ecs_task_role_arn" {
  value = module.iam.ecs_task_role_arn
}

# ----------------------
# ecr
# ----------------------

output "ecr_repository_url" {
  value = module.ecr.repository_url
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

# ----------------------
# ecs
# ----------------------

# ECS Cluster
output "cluster_id" {
  value = module.ecs.cluster_id
}

output "cluster_arn" {
  value = module.ecs.cluster_arn
}

# ECS Task Definition
output "task_definition_arn" {
  value = module.ecs.task_definition_arn
}

# ECS Service
output "service_arn" {
  value = module.ecs.service_arn
}

output "service_name" {
  value = module.ecs.service_name
}


# ----------------------
# alb
# ----------------------

output "alb_arn" {
  value = module.alb.alb_arn
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "listener_arn" {
  value = module.alb.listener_arn
}

output "target_group_arn" {
  value = module.alb.target_group_arn
}


# ----------------------
#  acm
# ----------------------

domain_name   = "threat-composer.com"
zone_id       = "Z123456789EXAMPLE"
record_name   = "www.threat-composer.com"

# ----------------------
# route53
# ----------------------


alb_dns_name  = "alb-prod-123456.us-east-1.elb.amazonaws.com"
tags = {
  Environment = "prod"
  Project     = "threat-composer"
}
