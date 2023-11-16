resource "aws_efs_mount_target" "pub-a" {
  file_system_id = aws_efs_file_system.main.id
  subnet_id = var.vpc.subnet.teshima-subnet-pub-a.id
  security_groups = [var.vpc.sg.teshima-sg-efs.id]
}

resource "aws_efs_mount_target" "pub-c" {
  file_system_id = aws_efs_file_system.main.id
  subnet_id = var.vpc.subnet.teshima-subnet-pub-c.id
  security_groups = [var.vpc.sg.teshima-sg-efs.id]
}