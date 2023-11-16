resource "aws_rds_cluster_parameter_group" "main" {
    name = "cluster-pg-for-wp"
    family = "aurora5.6"
    description = "for datalake"

    parameter {
      name = "general_log"
      value = 1
    }
    parameter {
      name = "slow_query_log"
      value = 1
    }
    parameter {
      name = "long_query_time"
      value = 0
    }
    parameter {
      name = "server_audit_logging"
      value = 1
    }
    parameter {
      name = "server_audit_events"
      value = "QUERY"
    }
    parameter {
      name = "log_output"
      value = "FILE"
    }
}