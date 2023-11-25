resource "aws_iam_role" "web-server" {
  name               = "web-server_datalake"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.web-server_assume_role_policy.json
}

resource "aws_iam_role" "lambda-role" {
  name = "lambda-role-for-datalake"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role" "firehose-to-s3" {
  name = "firehose-to-s3"
  assume_role_policy = data.aws_iam_policy_document.assume_role_firehose.json
}

resource "aws_iam_role" "cloudwatch-logs-to-s3" {
  name = "cloudwatch-logs-to-s3"
  assume_role_policy = data.aws_iam_policy_document.assume_role_cloudwatch_logs.json
}