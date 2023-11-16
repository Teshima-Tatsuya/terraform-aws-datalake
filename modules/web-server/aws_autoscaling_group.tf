resource "aws_autoscaling_group" "web" {
  name                      = "teshima-asg-datalake"
  max_size                  = 2
  min_size                  = 1
  health_check_grace_period = 180
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = true

  target_group_arns = [var.elb.tg.arn]

  vpc_zone_identifier = [var.vpc.subnet.teshima-subnet-pub-a.id, var.vpc.subnet.teshima-subnet-pub-c.id]

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  lifecycle {
    ignore_changes = [ 
      desired_capacity,
      min_size
    ]
  }
}