resource "aws_launch_template" "web" {
  name        = "teshima-lt-wordpress"
  description = "launch template for web"

  image_id      = "ami-0e0602b37ad08dce6"
  instance_type = "t2.micro"
  key_name      = data.aws_key_pair.teshima-keypair.key_name
  iam_instance_profile {
    name = var.iam.profile.name
  }
  vpc_security_group_ids = [var.vpc.sg.teshima-sg-web.id]

  user_data = base64encode(file("${path.module}/files/userdata.sh"))

  update_default_version = true

  monitoring {
    enabled = true
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name       = "teshima-web"
      ServerType = "Web"
    }
  }
}