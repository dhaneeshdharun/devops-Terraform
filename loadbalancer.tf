resource "aws_lb" "aws-elb"{
  load_balancer_type = "application"
  subnets = [ aws_subnet.my-subnet-1.id,aws_subnet.my-subnet-2.id ]
  security_groups = [ aws_security_group.my-security-elb.id ]
  tags = {
    Name = "terraform-ELB"
  }
}