resource "aws_iam_instance_profile" "web-server" {
    name = "web-server_datalake"
    role = aws_iam_role.web-server.name
}