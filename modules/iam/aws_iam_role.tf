resource "aws_iam_role" "web-server" {
  name               = "web-server_datalake"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.web-server_assume_role_policy.json
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "lambda-role" {
  name = "lambda-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}
