variable "firehose" {
  default = {
    "audit" = {
      name = "datalake-aurora-audit-logs"
      prefix = "datalake/firehose/aurora_audit_logs"
    },
    "error" = {
      name = "datalake-aurora-error-logs"
      prefix = "datalake/firehose/aurora_error_logs"
    },
    "general" = {
      name = "datalake-aurora-general-logs"
      prefix = "datalake/firehose/aurora_general_logs"
    },
    "slow-query" = {
      name = "datalake-aurora-slow-query-logs"
      prefix = "datalake/firehose/aurora_slow_query_logs"
    },
  }
}