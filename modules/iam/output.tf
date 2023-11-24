output "iam" {
  value = {
    "role" = aws_iam_role.web-server
    "role_lambda" = aws_iam_role.lambda-role
    "role_firehose" = aws_iam_role.firehose-to-s3
    "profile" = aws_iam_instance_profile.web-server
  }
}