resource "aws_security_group" "this" {
  name_prefix = "rds_sg_"

  ingress {
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = var.db_port
    to_port          = var.db_port
    protocol         = "tcp"
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_db_instance" "this" {
  allocated_storage          = var.db_allocated_storage
  storage_type               = var.db_storage_type
  engine                     = var.db_engine
  engine_version             = var.db_engine_version
  instance_class             = var.db_instance_class
  identifier                 = var.db_instance_identifier
  username                   = var.db_username
  password                   = var.db_password
  parameter_group_name       = var.db_parameter_group_name
  publicly_accessible        = var.db_publicly_accessible
  skip_final_snapshot        = var.db_skip_final_snapshot
  storage_encrypted          = var.db_storage_encrypted
  auto_minor_version_upgrade = var.db_auto_minor_version_upgrade
  port                       = var.db_port
  vpc_security_group_ids     = [aws_security_group.this.id]
}
