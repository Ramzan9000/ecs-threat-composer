output "service_arn" {
  value = aws_ecs_service.this.arn
}

output "service_name" {
  value = aws_ecs_service.this.name
}
