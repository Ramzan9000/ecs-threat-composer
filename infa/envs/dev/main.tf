

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
# Security groups
# ----------------------

module "security_groups" {
  source = "../../modules/security_groups"

  vpc_id               = var.vpc_id
  project_name         = var.project_name
  allowed_ingress_cidrs = var.allowed_ingress_cidrs
}


# ----------------------
# IAM
# ----------------------

module "iam" {
  source = "../../modules/iam"

  alb_role_name          = "dev-alb-role"
  ecs_execution_role_name = "dev-ecs-execution-role"
  ecs_task_role_name      = "dev-ecs-task-role"
}



# ----------------------
# ecr
# ----------------------

module "ecr" {
  source          = "../../modules/ecr"
  repository_name = var.ecr_repository_name
  tags            = var.tags
}


# ----------------------
# ecs
# ----------------------

module "ecs" {
  source = "../../modules/ecs"

  # ECS Cluster
  cluster_name = var.cluster_name

  # Task Definition
  task_name            = var.task_name
  container_definitions = var.container_definitions
  cpu                   = var.cpu
  memory                = var.memory
  execution_role_arn    = module.iam.ecs_execution_role_arn
  task_role_arn         = module.iam.ecs_task_role_arn

  # ECS Service
  service_name       = var.service_name
  desired_count      = var.desired_count
  launch_type        = "FARGATE"
  subnet_ids         = module.vpc.private_subnet_ids
  security_group_ids = [module.security_group.ecs_sg_id]
  target_group_arn   = module.alb.target_group_arn
  container_name     = var.container_name
  container_port     = var.container_port
  depends_on         = [module.vpc, module.iam]
}




# ----------------------
# alb
# ----------------------

module "alb" {
  source = "../../modules/alb"

  alb_name            = var.alb_name
  subnet_ids          = var.public_subnet_ids
  security_group_ids  = var.alb_security_group_ids

  target_group_name    = var.target_group_name
  target_group_port    = var.target_group_port
  target_group_protocol = var.target_group_protocol

  listener_port       = var.listener_port
  listener_protocol   = var.listener_protocol
}





# ----------------------
#  acm
# ----------------------

module "acm" {
  source = "../../modules/acm"

  domain_name = var.domain_name
  zone_id     = var.zone_id
  tags        = var.tags
}


# ----------------------
# route53
# ----------------------

module "route53" {
  source = "../../modules/route53"

  zone_id     = var.zone_id
  record_name = var.record_name
  ttl         = var.ttl
  records     = [var.alb_dns_name]  # Link the ALB to the Route53 record
}



