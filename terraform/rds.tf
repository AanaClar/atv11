resource "aws_db_instance" "rds_postgres" {
  allocated_storage = 20
  identifier = "to-do-db"
  storage_type = "gp2"           
  engine = "postgres" 
  engine_version = "16"
  instance_class = "db.t3.micro"
  multi_az = true

  username = "postgres"
  password = "220279lucas12435"

  db_subnet_group_name = aws_db_subnet_group.private_db_subnet.name  
  skip_final_snapshot = true

  vpc_security_group_ids = [
    aws_security_group.rds_sg.id
  ]
}
