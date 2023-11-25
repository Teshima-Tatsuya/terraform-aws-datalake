resource "aws_cloudwatch_log_subscription_filter" "main" {
    for_each = toset(local.name)

    name = "alllogs"
    destination_arn = var.kinesis[each.value].arn
    log_group_name = aws_cloudwatch_log_group.main[each.value].name
    role_arn = var.role.arn
    filter_pattern = ""
}