output "public_ip" {
  description = "La dirección IP pública de la instancia EC2"
  value       = aws_instance.ec2.public_ip
}

output "key_name" {
  description = "El key pair asociado a la instancia EC2"
  value       = aws_instance.ec2.key_name
}

output "ssh_user" {
  description = "El usuario SSH predeterminado para conectarse a la instancia"
  value       = var.os_type == "windows" ? "Administrator" : "ec2-user"
}
