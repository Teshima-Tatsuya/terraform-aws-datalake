locals {
  name = [
    "audit",
    "error",
    "general",
    "slowquery",
  ]
}

resource "aws_cloudwatch_log_group" "main" {
    for_each = toset(local.name)

    name = "/aws/rds/cluster/${var.aurora.cluster_identifier}/${each.value}"
}