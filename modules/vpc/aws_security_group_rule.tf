resource "aws_security_group_rule" "all" {
  for_each = var.sg_rule

  type = each.value.type
  description = each.value.description
  security_group_id = aws_security_group.all[each.value.sg].id
  from_port = each.value.from
  to_port = each.value.to
  protocol = each.value.protocol
  cidr_blocks = [each.value.cidr]
}