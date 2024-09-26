resource "aws_db_subnet_group" "private_db_subnet" {
  name        = "postgres-rds-private-subnet-group"
  description = "Private subnets for RDS instance"
  subnet_ids = ["${aws_subnet.private_subnet_a.id}", "${aws_subnet.private_subnet_b.id}"]
}

resource "aws_security_group" "rds_sg" {
  name        = "${var.environment}-rds-sg"
  description = "Allow inbound/outbound Postgres traffic"
  vpc_id      = aws_vpc.main.id
  depends_on  = [aws_vpc.main]
}

resource "aws_security_group_rule" "allow_postgres_in" {
  description              = "Allow inbound Postgres connections"
  type                     = "ingress"
  from_port                = "5432"
  to_port                  = "5432"
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.default.id
  security_group_id        = aws_security_group.rds_sg.id
}
