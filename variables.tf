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
# variable "access_log_bucket" {
#   type = string
# }
variable "ip_address_type" {
  type = string
}
# variable "access_log_enabled" {
#   type = bool
# }