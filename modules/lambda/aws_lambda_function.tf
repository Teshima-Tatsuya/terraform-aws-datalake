resource "aws_lambda_function" "main" {
    function_name = "teshima-datalake-transformation"
    handler = "index.handler"
    runtime = "python3.8"
    timeout = 300
    filename      = "${path.module}/archive/index.zip" 
    role = var.role.arn
}