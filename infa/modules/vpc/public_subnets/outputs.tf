output "ids" {
  value       = aws_subnet.public[*].id
  description = "IDs of all public subnets"
}
