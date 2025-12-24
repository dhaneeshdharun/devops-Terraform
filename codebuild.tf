resource "aws_codebuild_project" "code-build" {
  name = "terraform-codebuild"
  service_role = aws_iam_role.aws-service_role.arn
  source {
    type = "GITHUB"
    location = "https://github.com/dhaneeshdharun/pipe.git"
    buildspec = "buildspec.yml"
  }
  artifacts {
    type = "S3"
    location = aws_s3_bucket.aws-bucket.bucket
    packaging = "ZIP"
    name = "arti"
  }
    environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:7.0"
    type         = "LINUX_CONTAINER"
  }

  logs_config {
    cloudwatch_logs {
      group_name = "/aws/codebuild/terraform-codebuild"
    }
  }
}