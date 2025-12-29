# modules/ecs/variables.tf

# ECS Cluster
variable "cluster_name" {
  description = "Name of the ECS Cluster"
  type        = string
}

# ECS Task Definition
variable "task_name" {
  description = "Name of the ECS Task Definition"
  type        = string
}

variable "container_definitions" {
  description = "JSON-formatted container definitions for the task"
  type        = string
}

variable "cpu" {
  description = "CPU units for the task"
  type        = number
}

variable "memory" {
  description = "Memory in MiB for the task"
  type        = number
}

# ECS Service
variable "service_name" {
  description = "Name of the ECS Service"
  type        = string
}

variable "desired_count" {
  description = "Number of tasks to run in the service"
  type        = number
}

variable "launch_type" {
  description = "Launch type for the ECS Service (e.g., FARGATE)"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to launch ECS tasks in"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs to attach to ECS tasks"
  type        = list(string)
}

variable "target_group_arn" {
  description = "ARN of the ALB target group to attach the ECS service to"
  type        = string
}
