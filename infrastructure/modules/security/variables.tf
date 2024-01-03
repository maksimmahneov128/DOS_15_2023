variable "name" {
  description = "The name of the security group"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "ingress" {
  description = "Allow incomming traffic"
  type    = list(object({
    from_port  = number
    to_port    = number
    protocol   = string
    cidr_blocks = list(string)
  }))
}

variable "egress" {
  description = "Allow outgoing traffic"
  type    = list(object({
    from_port  = number
    to_port    = number
    protocol   = string
    cidr_blocks = list(string)
  }))
}