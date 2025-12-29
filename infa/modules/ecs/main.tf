
# -----------------------
# ECS Cluster
# -----------------------
resource "aws_ecs_cluster" "this" {
  name = var.cluster_name
}

# -----------------------
# ECS Task Definition Submodule
# -----------------------
module "ecs_task_definition" {
  source        = "./submodules/task_definition"
  cluster_id    = aws_ecs_cluster.this.id
  task_name     = var.task_name
  container_definitions = var.container_definitions
  cpu           = var.cpu
  memory        = var.memory
}

# -----------------------
# ECS Service Submodule
# -----------------------
module "ecs_service" {
  source               = "./submodules/service"
  cluster_id           = aws_ecs_cluster.this.id
  service_name         = var.service_name
  desired_count        = var.desired_count
  launch_type          = var.launch_type
  task_definition_arn  = module.ecs_task_definition.task_definition_arn
  subnet_ids           = var.subnet_ids
  security_group_ids   = var.security_group_ids
  target_group_arn     = var.target_group_arn
}
