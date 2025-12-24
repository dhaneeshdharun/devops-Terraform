resource "aws_route_table_association" "my-route-association-1" {
  route_table_id = aws_route_table.my-route.id
  subnet_id = aws_subnet.my-subnet-1.id
}

resource "aws_route_table_association" "my-route-association-2" {
  route_table_id = aws_route_table.my-route.id
  subnet_id = aws_subnet.my-subnet-2.id
}