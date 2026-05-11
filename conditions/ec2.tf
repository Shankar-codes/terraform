
resource "aws_instance" "Terraform" {
  ami           = var.ami_id
  instance_type = var.instance_type == "prod" ? var.instance_type : "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = var.ec2_tags
}

resource "aws_security_group" "allow_all" {
  name        = var.sg_name

  tags = {
    Name = "allow_all"
  }

  egress {
    from_port        = var.egress_from_port
    to_port          = var.egress_to_port
    protocol         = var.protocol
    cidr_blocks      = var.cidr
  }

  ingress {
    from_port        = var.ingress_from_port
    to_port          = var.ingress_to_port
    protocol         = var.protocol
    cidr_blocks      = var.cidr
  }
}
