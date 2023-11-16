data "aws_ssm_parameter" "amzn2_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

data "aws_key_pair" "teshima-keypair" {
  key_name = "teshima-keypair"
}

data "aws_iam_role" "autoscaling" {
  name = "AWSServiceRoleForAutoScaling"
}