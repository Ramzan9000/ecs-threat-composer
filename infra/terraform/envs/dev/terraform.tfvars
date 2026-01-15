#-----------------
# VPC Module
#-----------------

vpc_cidr        = "10.0.0.0/16"
public_subnets  = ["10.0.1.0/24", "10.0.3.0/24"]
private_subnets = ["10.0.2.0/24", "10.0.4.0/24"]
vpc_name        = "dev-thr-composer-vpc"
aws_region      = "eu-west-2"


#-----------------
# Security group
#-----------------

project_name          = "dev-thr-composer"
allowed_ingress_cidrs = ["0.0.0.0/0"]




#-----------------
# IAM Roles
#-----------------

alb_role_name           = "dev-alb-role"
ecs_execution_role_name = "dev-ecs-execution-role"
ecs_task_role_name      = "dev-ecs-task-role"

#-----------------
# ECR
#-----------------
ecr_repository_name = "dev-thr-composer-repo"

#-----------------
# ECS
#-----------------
cluster_name    = "dev-thr-composer-cluster"
task_name       = "dev-thr-container-task"
cpu             = "256"
memory          = "512"
service_name    = "dev-thr-container-service"
desired_count   = 2
container_name  = "threat-composer"
container_port  = 80
ecs_launch_type = "FARGATE"


#-----------------
# ALB
#-----------------

alb_name                   = "dev-thr-composer-alb"
alb_target_group_name      = "dev-thr-composer-tg"
alb_target_group_port      = 80
alb_target_group_protocol  = "HTTP"
alb_listener_http_port     = 80
alb_listener_http_protocol = "HTTP"




#-----------------
# ACM / Route53
#-----------------

# domain_name = "threat-composer.com"

# Hosted zone ID 
zone_id = ""

# Record for ALB
record_name = "www.threat-composer.com"
ttl         = 300

# ALB info (populated after ALB creation)
alb_dns_name = "" # Terraform can pass module.alb.dns_name here
alb_zone_id  = "" # Terraform can pass module.alb.zone_id here

# validation_method  = "DNS" 

#-----------------
# Tags
#-----------------

tags = {
  Environment = "dev"
  project     = "threat-composer"
}



