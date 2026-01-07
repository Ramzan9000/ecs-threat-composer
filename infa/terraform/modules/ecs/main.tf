
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
  source                = "./submodules/task_definition"

  cpu                   = var.cpu
  memory                = var.memory
  task_name             = var.task_name
  execution_role_arn    = var.execution_role_arn # ✅ reference module variable
  task_role_arn         = var.task_role_arn    # ✅ reference module variable
  container_image       = var.container_image
  container_name        = var.container_name
  container_port        = var.container_port

}





# -----------------------
# ECS Service Submodule
# -----------------------
module "ecs_service" {
  source               = "./submodules/service"
  cluster_arn          = aws_ecs_cluster.this.arn 
  container_port       = var.container_port
  container_name       = var.container_name 
  service_name         = var.service_name
  desired_count        = var.desired_count
  launch_type          = var.launch_type
  task_definition_arn  = module.ecs_task_definition.task_definition_arn
  subnet_ids           = var.subnet_ids
  security_group_ids   = var.security_group_ids
  target_group_arn     = var.target_group_arn
}

