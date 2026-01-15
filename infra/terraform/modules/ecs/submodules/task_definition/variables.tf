
variable "task_name" {}
variable "cpu" {}
variable "memory" {}
variable "execution_role_arn" {}
variable "task_role_arn" {}
variable "container_name" {}
variable "container_image" {
  description = "Container image URL"
  type        = string
  default     = "amazonlinux:2"
}

variable "container_port" {}
