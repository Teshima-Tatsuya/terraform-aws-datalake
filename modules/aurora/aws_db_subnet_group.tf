resource "aws_db_subnet_group" "main" {
    description = "for wordpress"
    subnet_ids = [var.vpc.subnet.teshima-subnet-pri-a.id, var.vpc.subnet.teshima-subnet-pri-c.id]
}