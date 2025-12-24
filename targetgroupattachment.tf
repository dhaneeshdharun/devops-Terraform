resource "aws_lb_listener" "aws-load-forward" {
 load_balancer_arn = aws_lb.aws-elb.arn
  protocol = "HTTP"
  port = 80
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.aws-targetgroup.arn
  }
}