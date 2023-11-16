output "iam" {
  value = {
    "role" = aws_iam_role.web-server
    "profile" = aws_iam_instance_profile.web-server
  }
}