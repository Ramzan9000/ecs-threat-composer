# ----------------------
# VPC
# ----------------------

module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  vpc_name        = var.vpc_name
}

# ----------------------
# Security Groups
# ----------------------

module "security_groups" {
  source = "../../modules/security_groups"

  vpc_id                = module.vpc.vpc_id # dynamic output from VPC module
  project_name          = var.project_name  # static, from tfvars
  allowed_ingress_cidrs = var.allowed_ingress_cidrs
}

# ----------------------
# IAM
# ----------------------

module "iam" {
  source = "../../modules/iam"

  alb_role_name           = var.alb_role_name # static, from tfvars
  ecs_execution_role_name = var.ecs_execution_role_name
  ecs_task_role_name      = var.ecs_task_role_name
}

# ----------------------
# ECR
# ----------------------

module "ecr" {
  source          = "../../modules/ecr"
  repository_name = var.ecr_repository_name
  tags            = var.tags
}

# ----------------------
# ECS
# ----------------------

module "ecs" {
  source = "../../modules/ecs"

  # ECS Cluster
  cluster_name = var.cluster_name

  # ECS Task Definition
  task_name          = var.task_name
  cpu                = var.cpu
  memory             = var.memory
  execution_role_arn = module.iam.ecs_execution_role_arn # dynamic from IAM module
  task_role_arn      = module.iam.ecs_task_role_arn      # dynamic from IAM module
  container_image    = var.container_image


  # ECS Service
  service_name       = var.service_name
  desired_count      = var.desired_count
  launch_type        = var.ecs_launch_type
  subnet_ids         = module.vpc.private_subnet_ids            # dynamic from VPC module
  security_group_ids = [module.security_groups.ecs_tasks_sg_id] # dynamic from Security Groups module
  target_group_arn   = module.alb.target_group_arn              # dynamic from ALB module
  container_name     = var.container_name
  container_port     = var.container_port

  depends_on = [module.vpc, module.iam, module.security_groups, module.alb]
}

# ----------------------
# ALB
# ----------------------

module "alb" {
  source = "../../modules/alb"

  alb_name           = var.alb_name
  subnet_ids         = module.vpc.public_subnet_ids       # dynamic from VPC module
  security_group_ids = [module.security_groups.alb_sg_id] # dynamic from Security Groups module
  vpc_id             = module.vpc.vpc_id

  target_group_name     = var.alb_target_group_name
  target_group_port     = var.alb_target_group_port
  target_group_protocol = var.alb_target_group_protocol

  listener_port     = var.alb_listener_http_port
  listener_protocol = var.alb_listener_http_protocol
}

# ----------------------
# ACM
# ----------------------

# module "acm" {
#  source = "../../modules/acm"
#  zone_id     = var.zone_id 
#  domain_name = var.domain_name
#  tags        = var.tags
# }

# ----------------------
# Route53
# ----------------------

# module "route53" {
#   source = "../../modules/route53"
#
#   zone_id      = var.zone_id
#   record_name  = var.record_name
#   alb_dns_name = module.alb.dns_name
#   alb_zone_id  = module.alb.zone_id
#
#   depends_on = [module.alb]
# }
