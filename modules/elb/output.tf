output "elb" {
    value = {
        "alb" = aws_lb.alb
        "tg" = aws_lb_target_group.alb-http
    }
}