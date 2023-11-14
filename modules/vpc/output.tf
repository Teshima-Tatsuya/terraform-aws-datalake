output "vpc" {
    value = {
        subnet = aws_subnet.all
        sg = aws_security_group.all
        vpc = aws_vpc.main
    }
}