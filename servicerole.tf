resource "aws_iam_role" "aws-service_role" {
  name = "aws-terraform-service-role"
  assume_role_policy = jsonencode(
    {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "codebuild.amazonaws.com"
                ]
            }
        }
    ]
}
  )
}