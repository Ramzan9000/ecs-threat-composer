
# modules/ecs/outputs.tf

# ECS Cluster ID
output "cluster_id" {
  value       = aws_ecs_cluster.this.id
  description = "The ID of the ECS Cluster"
}

# ECS Cluster ARN
output "cluster_arn" {
  value       = aws_ecs_cluster.this.arn
  description = "The ARN of the ECS Cluster"
}

# ECS Task Definition ARN
output "task_definition_arn" {
  value       = module.ecs_task_definition.task_definition_arn
  description = "The ARN of the ECS Task Definition"
}

# ECS Service ARN
output "service_arn" {
  value       = module.ecs_service.service_arn
  description = "The ARN of the ECS Service"
}

# ECS Service Name
output "service_name" {
  value       = module.ecs_service.service_name
  description = "The name of the ECS Service"
}

