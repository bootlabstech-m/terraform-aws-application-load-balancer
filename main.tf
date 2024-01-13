resource "aws_lb" "balance_the_load" {
  name               = var.lb_name
  internal           = var.internal
  load_balancer_type = "application"
  ip_address_type    = var.ip_address_type
  security_groups    = var.security_groups
  subnets            = var.subnets
  enable_deletion_protection       = false
  desync_mitigation_mode           = "defensive"
  drop_invalid_header_fields       = false
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  preserve_host_header             = false
  xff_header_processing_mode       = "append"

    lifecycle {
    ignore_changes = [tags,access_logs]
  }
  }
  resource "aws_lb_target_group" "tg" {
  name     = var.target_group_name
  port     = var.target_port
  protocol = var.target_protocol
  vpc_id   = var.vpc_id
  target_type = var.target_type
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = var.target_id
  port             = var.target_port
}

resource "aws_lb_listener" "front_end" {
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





