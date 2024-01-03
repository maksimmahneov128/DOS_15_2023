output "vpc_name" {
  value = var.vpc_name
  description = "The VPC name"
}

output "vpc_cidr" {
  value = var.vpc_cidr
  description = "The VPC CIDR"
}

output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the VPC"
}

output "public_subnet_id" {
  value       = aws_subnet.public.id
  description = "The ID of the public subnet"
}

output "private_subnet_id" {
  value       = aws_subnet.private.id
  description = "The ID of the private subnet"
}

output "route_table_id" {
  value       = aws_route_table.main.id
  description = "The ID of the route table"
}

output "internet_gateway_id" {
  value       = aws_internet_gateway.igw.id
  description = "The ID of the internet gateway"
}