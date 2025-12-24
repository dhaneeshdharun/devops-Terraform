resource "aws_route_table" "my-route" {
  vpc_id = aws_vpc.my-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
  }
  tags = {
    Name = "terraform-route"
  }
}
/*
Note: This is a generated HCL content from the JSON input which is based on the latest API version available.
To import the resource, please run the following command:
terraform import azapi_resource. ?api-version=TODO

Or add the below config:
import {
  id = "?api-version=TODO"
  to = azapi_resource.
}
*/

resource "azapi_resource" "" {
  type      = "@TODO"
  parent_id = "/subscriptions/$${var.subscriptionId}/resourceGroups/$${var.resourceGroupName}"
  name      = ""
  body = {
    Statement = [{
      Action   = ["secretsmanager:GetSecretValue", "secretsmanager:DescribeSecret"]
      Effect   = "Allow"
      Resource = "arn:aws:secretsmanager:eu-north-1:978489150432:secret:dhaneesh-token-*"
    }]
    Version = "2012-10-17"
  }
}
