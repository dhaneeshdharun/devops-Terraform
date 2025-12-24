resource "aws_subnet" "my-subnet-1" {
  vpc_id = aws_vpc.my-vpc.id
  availability_zone = "ap-northeast-1a"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "terraform-subnet-1"  
    }
}

resource "aws_subnet" "my-subnet-2" {
  vpc_id = aws_vpc.my-vpc.id
  availability_zone = "ap-northeast-1c"
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "terraform-subnet-2"
  }
}