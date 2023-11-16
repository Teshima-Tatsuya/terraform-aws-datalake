resource "aws_efs_file_system" "main" {
  tags = {
    Name = "teshima-wp-efs"
  }
}