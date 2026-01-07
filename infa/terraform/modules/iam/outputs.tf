output "alb_role_arn" {
  value       = module.alb_role.role_arn
  description = "ARN of the ALB IAM Role"
}

output "ecs_execution_role_arn" {
  value       = module.ecs_execution_role.role_arn
  description = "ARN of the ECS Execution Role"
}

output "ecs_task_role_arn" {
  value       = module.ecs_task_role.role_arn
  description = "ARN of the ECS Task Role"
}
