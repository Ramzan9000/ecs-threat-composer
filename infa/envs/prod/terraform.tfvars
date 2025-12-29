# VPC
vpc_cidr        = "10.0.0.0/16"
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
vpc_name        = "prod-vpc"

# IAM roles
alb_role_name           = "prod-alb-role"
ecs_execution_role_name = "prod-ecs-execution-role"
ecs_task_role_name      = "prod-ecs-task-role"

# ECS
ecs_cluster_name        = "prod-ecs-cluster"
ecs_service_name        = "prod-ecs-service"
ecs_task_count          = 3

# ECR
ecr_repo_name           = "prod-threat-composer"

# ALB
alb_name                = "prod-alb"
alb_listener_http_port  = 80
alb_listener_https_port = 443
target_group_name_http  = "prod-tg-http"
target_group_name_https = "prod-tg-https"

# Route53 & ACM
domain_name             = "myprodapp.com"
certificate_arn         = "arn:aws:acm:us-east-1:123456789012:certificate/xxxx-xxxx-xxxx-xxxx"

# Security Groups (optional, if using variables)
sg_app_name             = "prod-app-sg"
sg_alb_name             = "prod-alb-sg"
