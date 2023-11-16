resource "aws_iam_role_policy_attachment" "web-server_ssm" {
  role       = aws_iam_role.web-server.name
  policy_arn = data.aws_iam_policy.AmazonSSMManagedInstanceCore.arn
}

resource "aws_iam_role_policy_attachment" "web-server_cloudwatch" {
  role       = aws_iam_role.web-server.name
  policy_arn = data.aws_iam_policy.CloudWatchAgentServerPolicy.arn
}
resource "aws_iam_role_policy_attachment" "web-server_ssm_parameter" {
  role       = aws_iam_role.web-server.name
  policy_arn = aws_iam_policy.web-server.arn
}
resource "aws_iam_role_policy_attachment" "web-server_s3" {
  role       = aws_iam_role.web-server.name
  policy_arn = data.aws_iam_policy.AmazonS3FullAccess.arn
}
resource "aws_iam_role_policy_attachment" "lambda-for-datalake" {
  role       = aws_iam_role.lambda-role.name
  policy_arn = aws_iam_policy.lambda-for-datalake.arn
}
resource "aws_iam_role_policy_attachment" "firehose-to-s3" {
  role       = aws_iam_role.firehost-to-s3.name
  policy_arn = aws_iam_policy.firehose-to-s3.arn
}