resource "aws_autoscaling_policy" "web-server_cpu_up" {
  name                   = "web-server_cpu_up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 150
  autoscaling_group_name = aws_autoscaling_group.web.name
}

resource "aws_autoscaling_policy" "web-server_cpu_down" {
  name                   = "web-server_cpu_down"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 150
  autoscaling_group_name = aws_autoscaling_group.web.name
}
