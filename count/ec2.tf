resource "aws_instance" "Terraform" {
  count         = length(var.instances)
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = {
    Name = var.instances[count.index]
    Terraform = "True"
    Project = "Ellamma roboshop"
  }
}

resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  

  ingress {
    from_port   = var.ingress_from_port
    to_port     = var.ingress_to_port
    protocol    = var.protocol
    cidr_blocks = var.cidr
  }

  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.protocol
    cidr_blocks = var.cidr
  }

  tags = {
    Name = "allow_all"
  }
}