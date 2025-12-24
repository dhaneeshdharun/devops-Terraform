resource "aws_launch_template" "aws-launch" {
  name = "aws-launch-template"
  description = "for tomcat service"
  instance_type = "t3.micro"
  image_id = "ami-09cd9fdbf26acc6b4" 
  network_interfaces {
    security_groups = [ aws_security_group.my-security-ec2.id ]
    associate_public_ip_address = true
  }
user_data = base64encode(<<EOF
#!/bin/bash
sudo yum update -y
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo docker pull tomcat:latest
# This runs tomcat and copies default webapps so you see a 200 OK page
sudo docker run -d -p 8080:8080 tomcat:latest /bin/bash -c "cp -r /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps/ && catalina.sh run"
EOF
  )
  }
