variable "region" {
  type = string
}
variable "role_arn" {
  type = string
}
variable "lb_name" {
  type = string
}
variable "internal" {
  type = bool
}
variable "security_groups" {
  type = list(string)
}
variable "subnets" {
  type = list(string)
}
variable "enable_deletion_protection" {
  type = bool
}
variable "enable_cross_zone_load_balancing" {
  type = bool
}
variable "ip_address_type" {
  type = string
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

