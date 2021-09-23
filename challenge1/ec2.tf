resource "aws_instance" "web_server_1" {
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = var.zones[0]
  vpc_security_group_ids = [aws_security_group.webserver_sg.id]
  subnet_id              = aws_subnet.public_subnet_1.id
  user_data              = file("web-install.sh")

  tags = {
    Name = "web-server-1"
  }

}

resource "aws_instance" "web_server_2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = var.zones[1]
  vpc_security_group_ids = [aws_security_group.webserver_sg.id]
  subnet_id              = aws_subnet.public_subnet_2.id
  user_data              = file("web-install.sh")

  tags = {
    Name = "web-server-2"
  }

}
