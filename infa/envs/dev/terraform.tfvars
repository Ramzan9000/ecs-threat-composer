# -----------------------
# VPC Module
# -----------------------
vpc_cidr        = "10.0.0.0/16"
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
vpc_name        = "dev-thr-composer-vpc"

# -----------------------
# Security Groups
# -----------------------
alb_sg_name      = "dev-alb-sg"
ecs_sg_name      = "dev-ecs-sg"
alb_sg_ingress = [
  {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]
ecs_sg_ingress = [
  {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    security_groups = ["${module.sg.alb_sg_id}"]  # ALB can talk to ECS
  }
]

# -----------------------
# IAM Roles
# -----------------------
alb_role_name          = "dev-alb-role"
ecs_execution_role_name = "dev-ecs-execution-role"
ecs_task_role_name      = "dev-ecs-task-role"

# -----------------------
# ECR
# -----------------------
ecr_name = "dev-thr-composer-repo"

# -----------------------
# ECS
# -----------------------
ecs_cluster_name          = "dev-thr-composer-cluster"
ecs_task_family           = "dev-thr-composer-task"
ecs_task_cpu              = "256"
ecs_task_memory           = "512"
ecs_task_container_name   = "threat-composer"
ecs_task_container_port   = 8080
ecs_desired_count         = 2
ecs_launch_type           = "FARGATE"
ecs_subnet_ids            = ["${module.vpc.private_subnet_ids}"]
ecs_security_group_ids    = ["${module.sg.ecs_sg_id}"]

# -----------------------
# ALB
# -----------------------
alb_name       = "dev-thr-composer-alb"
alb_subnets    = ["${module.vpc.public_subnet_ids}"]
alb_sg_id      = "${module.sg.alb_sg_id}"

# Listeners
alb_listener_http_port  = 80
alb_listener_https_port = 443
alb_target_group_name   = "dev-thr-composer-tg"
alb_target_group_port   = 8080
alb_target_group_protocol = "HTTP"

# -----------------------
# ACM / Route53
# -----------------------
domain_name   = "threat-composer.com"
zone_id       = "Z123456789EXAMPLE"          # Your Route53 hosted zone ID
record_name   = "www.threat-composer.com"
ttl           = 300
alb_dns_name  = "${module.alb.alb_dns_name}"  # The ALB DNS that Route53 points to
tags = {
  Environment = "dev"
  Project     = "threat-composer"
}
