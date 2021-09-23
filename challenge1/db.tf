resource "aws_db_instance" "manage_database" {
  allocated_storage      = var.allocated_storage
  db_subnet_group_name   = aws_db_subnet_group.database_subnet.id
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.db_instance_class
  multi_az               = true
  name                   = "appdatabase"
  username               = var.username
  password               = var.password
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.database_sg.id]
}

resource "aws_db_subnet_group" "database_subnet" {
  name       = "main"
  subnet_ids = [aws_subnet.db_private_subnet_1.id, aws_subnet.db_private_subnet_2.id]

  tags = {
    Name = "database-subnet-group"
  }
}
