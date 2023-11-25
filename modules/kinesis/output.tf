output "kinesis" {
    value = {
        firehose = aws_kinesis_firehose_delivery_stream.main
    }
}