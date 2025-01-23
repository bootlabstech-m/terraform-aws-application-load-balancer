resource "aws_lb" "balance_the_load" {
  name                             = var.lb_name
  internal                         = var.internal
  load_balancer_type               = "application"
  ip_address_type                  = var.ip_address_type
  security_groups                  = var.security_groups
  subnets                          = var.subnets
  enable_deletion_protection       = var.enable_deletion_protection
  desync_mitigation_mode           = "defensive"
  drop_invalid_header_fields       = false
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  enable_http2                     = true
  idle_timeout                     = 60
  preserve_host_header             = false
  xff_header_processing_mode       = "append"

  lifecycle {
    ignore_changes = [tags, access_logs]
  }
}
resource "aws_lb_target_group" "tg" {
  name        = var.target_group_name
  port        = var.target_port
  protocol    = var.target_protocol
  vpc_id      = var.vpc_id
  target_type = var.target_type
}






