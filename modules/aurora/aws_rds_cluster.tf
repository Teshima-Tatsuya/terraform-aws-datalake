resource "aws_rds_cluster" "main" {
    database_name = "teshimawp"
    master_username = "teshima"
    master_password = "Passw0rd"
    db_subnet_group_name = aws_db_subnet_group.main.id
    engine = "aurora-mysql"
    engine_version = "5.7.mysql_aurora.2.11.4"
    engine_mode = "serverless"
    vpc_security_group_ids = [var.vpc.sg.teshima-sg-rds.id]
    db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.main.name

    scaling_configuration {
        auto_pause               = true
        max_capacity             = 1
        min_capacity             = 1
        seconds_until_auto_pause = 300
        timeout_action           = "ForceApplyCapacityChange"
    }
}