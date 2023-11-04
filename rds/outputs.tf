output "endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.this.endpoint
}

output "port" {
  description = "The port of the RDS instance"
  value       = aws_db_instance.this.port
}

output "username" {
  description = "The username to connect to the RDS instance"
  value       = aws_db_instance.this.username
}

output "password" {
  description = "The password to connect to the RDS instance. Be careful with this!"
  value       = aws_db_instance.this.password
  sensitive   = true
}
