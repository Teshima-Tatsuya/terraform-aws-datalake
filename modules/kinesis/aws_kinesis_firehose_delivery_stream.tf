resource "aws_kinesis_firehose_delivery_stream" "main" {
    for_each = var.kinesis

    name = each.value.name
    destination = "extended_s3"

    extended_s3_configuration {
        bucket_arn = "arn:aws:s3:::teshima-tokyo-bucket"
        role_arn = var.role.arn
        prefix = each.value.prefix
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
            }
        }
    }
}