resource "aws_security_group" "my-security-ec2" {
  vpc_id = aws_vpc.my-vpc.id
  description = "allow ssh and http access to ec2"
  ingress  {
     from_port = 22
     to_port = 22
     protocol = "tcp"
     cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    security_groups = [ aws_security_group.my-security-elb.id ]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  tags = {
    Name = "terraform-sg"
  }
}

resource "aws_security_group" "my-security-elb" {
  vpc_id = aws_vpc.my-vpc.id
  description = "allow the load balancer to access the internet"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}