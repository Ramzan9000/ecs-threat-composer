variable "service_name" {}
variable "cluster_arn" {}
variable "task_definition_arn" {}
variable "desired_count" {}
variable "launch_type" {}
variable "subnet_ids" {
  type = list(string)
}
variable "security_group_ids" {
  type = list(string)
}
variable "target_group_arn" {}
variable "container_name" {}
variable "container_port" {}
variable "depends_on" {
  type    = list(any)
  default = []
}
