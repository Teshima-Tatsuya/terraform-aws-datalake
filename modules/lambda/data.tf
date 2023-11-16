data "archive_file" "sample_function" {
  type        = "zip"
  source_dir  = "${path.module}/src"
  output_path = "${path.module}/archive/index.zip"
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

