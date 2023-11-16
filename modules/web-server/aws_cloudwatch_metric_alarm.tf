resource "aws_cloudwatch_metric_alarm" "cpu_up" {
  alarm_name          = "CPUUtilization_websrv_up_datalake"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  datapoints_to_alarm = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 60

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.web.name
  }

  alarm_actions     = [aws_autoscaling_policy.web-server_cpu_up.arn]
}
resource "aws_cloudwatch_metric_alarm" "cpu_down" {
  alarm_name          = "CPUUtilization_websrv_down_datalake"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 2
  datapoints_to_alarm = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 5

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.web.name
  }

  alarm_actions     = [aws_autoscaling_policy.web-server_cpu_down.arn]
}

