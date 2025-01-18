output "instance_public_ip" {
  description = "Public IP address of the Windows Server instance"
  value       = aws_instance.windows_server.public_ip
}

output "instance_id" {
  description = "ID of the Windows Server instance"
  value       = aws_instance.windows_server.id
}

output "private_key_path" {
  description = "Path to the private key file"
  value       = local_file.private_key.filename
}
