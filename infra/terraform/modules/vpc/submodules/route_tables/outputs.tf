output "public_route_table_id" {
  value       = aws_route_table.public.id
  description = "ID of the public route table"
}

output "private_route_table_id" {
  value       = aws_route_table.private.id
  description = "ID of the private route table"
}
