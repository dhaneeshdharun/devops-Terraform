resource "aws_lb_target_group" "aws-targetgroup" {
  target_type = "instance"
  name = "target-group"
  protocol = "HTTP"
  port = 8080
  vpc_id = aws_vpc.my-vpc.id
 
  health_check {

    protocol = "HTTP"
    path = "/"
    matcher  = "200,404"
    
  }

  
}