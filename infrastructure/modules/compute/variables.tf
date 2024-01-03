variable "name" {
  description = "Name of the launch template"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the launch template"
  type        = string
}

variable "key_name" {
  description = "Key name for SSH access"
  type        = string
}

variable "user_data" {
  description = "For post-install scripts"
  type        = string
}

variable "public_ip_address" {
  description = "Whether to associate a public IP address"
  type        = bool
}

variable "security_group_id" {
  description = "ID of the security group"
  type        = string
}

variable "subnet_id" {
  description = "The VPC Subnet ID"
  type        = string
}