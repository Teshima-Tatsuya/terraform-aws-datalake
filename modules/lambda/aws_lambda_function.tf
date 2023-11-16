resource "aws_lambda_function" "main" {
    function_name = "teshima-datalake-transformation"
    handler = "index.handler"
    runtime = "python3.8"
    timeout = 300
    filename      = data.archive_file.sample_function.output_path
    role = var.role.arn
}