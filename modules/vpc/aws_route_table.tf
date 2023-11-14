resource "aws_route_table" "all" {
    for_each = var.route

    vpc_id = aws_vpc.main.id

    tags = {
        Name = each.key
    }   
}