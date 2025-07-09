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

resource "aws_lb_listener" "https_listener" {
  count             = var.listener_protocol == "HTTPS" ? 1 : 0
  load_balancer_arn = aws_lb.balance_the_load.arn
  port              = var.listener_port
  protocol          = var.listener_protocol
  ssl_policy        = var.ssl_policy
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

resource "aws_lb_listener" "http_listener" {
  count             = var.listener_protocol == "HTTP" ? 1 : 0
  load_balancer_arn = aws_lb.balance_the_load.arn
  port              = var.listener_port
  protocol          = var.listener_protocol

  default_action {
    type             = "forward" # supported values "redirect" "fixed-response"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
