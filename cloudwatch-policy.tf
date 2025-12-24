resource "aws_iam_policy" "aws-cloudwatch" {
  name = "terraform-cloudwatch-policy"
  policy = jsonencode(
    {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "CloudWatchLogsFullAccess",
            "Effect": "Allow",
            "Action": [
                "logs:*",
                "cloudwatch:GenerateQuery",
                "cloudwatch:GenerateQueryResultsSummary",
                "observabilityadmin:GetS3TableIntegration",
                "observabilityadmin:ListS3TableIntegrations",
                "observabilityadmin:ListTelemetryPipelines"
            ],
            "Resource": "*"
        }
    ]
}
  )
}