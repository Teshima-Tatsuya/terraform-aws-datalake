resource "aws_kinesis_firehose_delivery_stream" "main" {
    name = "datalake-aurora-audit-logs"
    destination = "extended_s3"

    extended_s3_configuration {
        bucket_arn = "arn:aws:s3:::teshima-tokyo-bucket"
        role_arn = var.role.arn
        prefix = "datalake/firehose/aurora_audit_logs/"
        compression_format = "UNCOMPRESSED"
        buffering_interval = 60
        buffering_size = 50

        processing_configuration {
            enabled = true
            processors {
                type = "Lambda"

                parameters {
                    parameter_name = "LambdaArn"
                    parameter_value = var.lambda.arn
                }
                parameters {
                    parameter_name = "NumberOfRetries"
                    parameter_value = 3
                }
                parameters {
                    parameter_name = "RoleArn"
                    parameter_value = var.role.arn
                }
                parameters {
                    parameter_name = "BufferSizeInMBs"
                    parameter_value = 3
                }
                parameters {
                    parameter_name = "BufferIntervalInSeconds"
                    parameter_value = 60
                }
            }
        }
    }
}