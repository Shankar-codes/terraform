resource "aws_route53_record" "ellamma-roboshop" {
  count = length(var.instances)
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.Terraform[count.index].public_ip]
  allow_overwrite = true
}