data "aws_iam_policy_document" "web-server_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "web-server" {
  statement {
    sid = "1"
    actions = ["ssm:GetParameter"]
    resources = [
      "*"
    ]
  }
}

data "aws_iam_policy_document" "lambda-for-datalake" {
  statement {
    sid = "1"
    actions = ["kinesis:*","firehose:*","klogs:*","kms:*"]
    resources = [
      "*"
    ]
  }
}