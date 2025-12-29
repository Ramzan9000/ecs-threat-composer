variable "alb_role_name" {
  type        = string
  description = "Name of the ALB IAM Role"
}

variable "ecs_execution_role_name" {
  type        = string
  description = "Name of the ECS Execution Role"
}

variable "ecs_task_role_name" {
  type        = string
  description = "Name of the ECS Task Role"
}
