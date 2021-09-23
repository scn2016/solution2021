resource "aws_lb" "external_alb" {
  name               = "external-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
}

resource "aws_lb_target_group" "external_tg_alb" {
  name     = "external-tg-alb"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.external_vpc.id
}

resource "aws_lb_target_group_attachment" "external_attach_alb1" {
  target_group_arn = aws_lb_target_group.external_tg_alb.arn
  target_id        = aws_instance.web_server_1.id
  port             = 80

  depends_on = [
    aws_instance.web_server_1,
  ]
}

resource "aws_lb_target_group_attachment" "external_attach_alb2" {
  target_group_arn = aws_lb_target_group.external_tg_alb.arn
  target_id        = aws_instance.web_server_2.id
  port             = 80

  depends_on = [
    aws_instance.web_server_2,
  ]
}

resource "aws_lb_listener" "external_listen_alb" {
  load_balancer_arn = aws_lb.external_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.external_tg_alb.arn
  }
}
