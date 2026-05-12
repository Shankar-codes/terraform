resource "aws_security_group" "allow_ellamma_all_ports" {
  name        = "allow_ellamma_all_ports"
  description = "Allow all inbound and outbound traffic"

 
  dynamic ingress {
     for_each = toset(var.ingress_ports)
     content {
    from_port        = ingress.value
    to_port          = ingress.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ellamma_all_ports"
  }
}
