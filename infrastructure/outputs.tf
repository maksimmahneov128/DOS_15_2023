output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_id" {
  value = module.network.public_subnet_id
}

output "private_subnet_id" {
  value = module.network.private_subnet_id
}

output "route_table_id" {
  value = module.network.route_table_id
}

output "internet_gateway_id" {
  value = module.network.internet_gateway_id
}

output "jenkins_master_sg_id" {
  value       = module.jenkins_master_security.security_group_id
  description = "The ID of the Jenkins Master security group"
}

output "jenkins_agent_sg_id" {
  value       = module.jenkins_agent_security.security_group_id
  description = "The ID of the Jenkins Slave security group"
}

output "jenkins_master_instance_id" {
  value       = module.jenkins_master.instance_id
  description = "The ID of the Jenkins Master instance"
}

output "jenkins_master_public_ip" {
  value       = module.jenkins_master.public_ip_address
  description = "The public IP address of the Jenkins Master instance"
}

output "jenkins_slave_instance_id" {
  value       = module.jenkins_agent.instance_id
  description = "The ID of the Jenkins Slave instance"
}

output "jenkins_slave_public_ip" {
  value       = module.jenkins_agent.public_ip_address
  description = "The public IP address of the Jenkins Slave instance"
}