locals {
  instance_type = var.instance_type
  ami_id        = data.aws_ami.ellamma_roboshop.id
  common_name     = "${var.project}-${var.environment}"
  ec2_tags = merge(
    var.common_tags,
  {
    Name = "${local.common_name}-ec2"
  }
  )
}
