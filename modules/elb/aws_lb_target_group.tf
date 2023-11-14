resource "aws_lb_target_group" "alb-http" {
    name = "teshima-tg-alb"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc.vpc.id
    target_type = "instance"

    health_check {
      protocol = "HTTP"
      healthy_threshold = 2
      interval = 5
      timeout = 2
    }
}