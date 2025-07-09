variable "region" {
  description = "The AWS region where resources will be created."
  type        = string
}

variable "role_arn" {
  description = "The ARN of the IAM role to associate with the resources."
  type        = string
}

variable "lb_name" {
  description = "The name of the Load Balancer to be created."
  type        = string
}

variable "internal" {
  description = "Whether the Load Balancer is internal (true) or internet-facing (false)."
  type        = bool
}

variable "security_groups" {
  description = "A list of security group IDs to associate with the Load Balancer."
  type        = list(string)
}

variable "subnets" {
  description = "A list of subnet IDs for the Load Balancer."
  type        = list(string)
}

variable "enable_deletion_protection" {
  description = "Whether deletion protection is enabled for the Load Balancer."
  type        = bool
}

variable "enable_cross_zone_load_balancing" {
  description = "Whether cross-zone load balancing is enabled for the Load Balancer."
  type        = bool
}

variable "ip_address_type" {
  description = "The type of IP address to use (e.g., ipv4 or dualstack)."
  type        = string
}

variable "target_group_name" {
  description = "Target Group Name"
  type        = string
}
variable "target_port" {
  type        = number
  description = "target group port"
}
variable "target_protocol" {
  type        = string
  description = "target group protocol eg. HTTP/S, TCP"
}
variable "vpc_id" {
  description = "Shared VPC id"
  type        = string
}
variable "target_type" {
  description = "Type of target group eg, instance,alb, lambda,ip "
  type        = string
}
variable "target_id" {
  description = "The ID of the target to register with the target group (e.g., instance ID or IP address)"
  type        = string
}

variable "listener_port" {
  description = "Port for the ALB listener (e.g., 443 for HTTPS)"
  type        = number
}

variable "listener_protocol" {
  description = "Protocol for the ALB listener (e.g., HTTP or HTTPS)"
  type        = string
}

variable "ssl_policy" {
  description = "SSL policy for HTTPS listeners (e.g., ELBSecurityPolicy-2016-08)"
  type        = string
}

variable "certificate_arn" {
  description = "ARN of the ACM certificate for HTTPS listener"
  type        = string
}


