resource "aws_instance" "todoList" {
  ami                    = "ami-0e86e20dae9224db8"
  instance_type          = "t2.micro"
  key_name               = "vockey"
  subnet_id              = aws_subnet.public_subnet_a.id
  associate_public_ip_address = true
  vpc_security_group_ids = [
    aws_security_group.default.id
  ]
}
