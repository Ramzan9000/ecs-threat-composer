output "ids" {
  value       = aws_subnet.private[*].id
  description = "IDs of all private subnets"
}
