# Call ALB Role submodule
module "alb_role" {
  source = "./submodules/alb_role"
  role_name = var.alb_role_name
}

# Call ECS Execution Role submodule
module "ecs_execution_role" {
  source = "./submodules/ecs_execution_role"
  role_name = var.ecs_execution_role_name
}

# Call ECS Task Role submodule
module "ecs_task_role" {
  source = "./submodules/ecs_task_role"
  role_name = var.ecs_task_role_name
}

