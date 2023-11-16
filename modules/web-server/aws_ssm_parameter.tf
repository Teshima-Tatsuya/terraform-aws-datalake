resource "aws_ssm_parameter" "cloudwatch_agent_config" {
    name = "cloudwatch_agent_config_datalake"
    type = "String"
    value = file("${path.module}/files/cloudwatch_agent_config.json")
}