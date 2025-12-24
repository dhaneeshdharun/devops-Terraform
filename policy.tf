resource "aws_iam_role_policy_attachment" "cloudwatch" {
  role       = aws_iam_role.aws-service_role.name
  policy_arn = aws_iam_policy.aws-cloudwatch.arn
}

resource "aws_iam_role_policy_attachment" "codebuild" {
  role       = aws_iam_role.aws-service_role.name
  policy_arn = aws_iam_policy.aws-codebuild-policy.arn
}

resource "aws_iam_role_policy_attachment" "ecr" {
  role       = aws_iam_role.aws-service_role.name
  policy_arn = aws_iam_policy.aws-ecr-policy.arn
}

resource "aws_iam_role_policy_attachment" "s3" {
  role       = aws_iam_role.aws-service_role.name
  policy_arn = aws_iam_policy.aws-S3.arn
}

resource "aws_iam_role_policy_attachment" "secrets" {
  role       = aws_iam_role.aws-service_role.name
  policy_arn = aws_iam_policy.aws-secret-policy.arn
}

resource "aws_iam_role_policy_attachment" "codeartifact" {
  role       = aws_iam_role.aws-service_role.name
  policy_arn = aws_iam_policy.codeartifact-policy.arn
}
