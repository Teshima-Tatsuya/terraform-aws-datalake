data "aws_iam_policy" "AmazonSSMManagedInstanceCore" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

data "aws_iam_policy" "CloudWatchAgentServerPolicy" {
  arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

data "aws_iam_policy" "AmazonS3FullAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_policy" "web-server" {
  name = "web-server_datalake"
  policy = data.aws_iam_policy_document.web-server.json
}

resource "aws_iam_policy" "lambda-for-datalake" {
  name = "lambda-for-datalake"
  policy = data.aws_iam_policy_document.lambda-for-datalake.json
}

resource "aws_iam_policy" "firehose-to-s3" {
  name = "firehose-to-s3"
  policy = data.aws_iam_policy_document.firehose-to-s3.json
}