data "aws_iam_policy_document" "web-server_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
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

data "aws_iam_policy_document" "firehose-to-s3" {
  statement {
    actions = ["s3:*"]
    resources = [
      "arn:aws:s3:::*"
    ]
  }

  statement {
    actions = ["lambda:InvokeFunction", "lambda:GetFunctionConfiguration", "logs:*", "kms:*"]
    resources = [
      "*"
    ]
  }
}

data "aws_iam_policy_document" "assume_role_firehose" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["firehose.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}