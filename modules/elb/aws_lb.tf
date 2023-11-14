resource "aws_lb" "alb" {
    name = "teshima-alb-datalake"
    internal = false
    load_balancer_type = "application"
    security_groups = [ var.vpc.sg.teshima-sg-alb.id ]

    subnets = [var.vpc.subnet.teshima-subnet-pub-a.id, var.vpc.subnet.teshima-subnet-pub-c.id]

    access_logs {
        bucket  = data.aws_s3_bucket.main.id
        prefix  = "datalake/alb"
        enabled = true
    }
}