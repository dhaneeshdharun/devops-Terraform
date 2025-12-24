resource "aws_autoscaling_group" "aws-autoscale" {
  name = "auto-scaling"
  desired_capacity = 2
  max_size = 3
  min_size = 1
  target_group_arns = [aws_lb_target_group.aws-targetgroup.arn] 
  vpc_zone_identifier = [ aws_subnet.my-subnet-1.id,aws_subnet.my-subnet-2.id ]
  health_check_type         = "ELB"
  health_check_grace_period = 300
  launch_template {
    id = aws_launch_template.aws-launch.id
    version = "$Latest"
  }
  depends_on = [ aws_internet_gateway.my-igw,
                 aws_route_table_association.my-route-association-1,
                 aws_route_table_association.my-route-association-2 ]
}