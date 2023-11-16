resource "aws_iam_role" "web-server" {
  name               = "web-server_datalake"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.web-server_assume_role_policy.json
}