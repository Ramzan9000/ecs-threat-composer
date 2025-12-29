variable "alb_name" {}
variable "subnet_ids" {
  type = list(string)
}
variable "security_group_ids" {
  type = list(string)
}

# Target group
variable "target_group_name" {}
variable "target_group_port" {}
variable "target_group_protocol" {}

# Listener
variable "listener_port" {}
variable "listener_protocol" {}
