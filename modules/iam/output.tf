output "iam" {
  value = {
    "role" = aws_iam_role.web-server
    "role_lambda" = aws_iam_role.lambda-role
    "profile" = aws_iam_instance_profile.web-server
    "temp" = data.aws_iam_policy_document.firehose-to-s3.json
  }
}