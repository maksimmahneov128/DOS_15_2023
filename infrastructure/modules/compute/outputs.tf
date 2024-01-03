output "instance_id" {
  description = "The ID of the instance"
  value       = aws_instance.jenkins-server.id
}

output "public_ip_address" {
  description = "The public IP address assigned to the instance"
  value       = aws_instance.jenkins-server.public_ip
}