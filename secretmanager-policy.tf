resource "aws_iam_policy" "aws-secret-policy" {
  name = "terraform-secretmanager-policy"
  policy = jsonencode(
    {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "SecretsManagerGetAndDescribeSecret",
            "Effect": "Allow",
            "Action": [
                "secretsmanager:GetSecretValue",
                "secretsmanager:DescribeSecret"
            ],
            "Resource": "arn:aws:secretsmanager:*:*:secret:*"
        },
        {
            "Sid": "KMSDecryptKey",
            "Effect": "Allow",
            "Action": [
                "kms:Decrypt"
            ],
            "Resource": "arn:aws:kms:*:*:key/*",
            "Condition": {
                "StringLike": {
                    "kms:EncryptionContext:SecretARN": "arn:aws:secretsmanager:*:*:secret:*",
                    "kms:ViaService": "secretsmanager.*.amazonaws.com"
                }
            }
        }
    ]
}
  )
}