data "aws_ami" "ellamma_roboshop" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

#this fetches the ami id of the image
output "ami_id"  {
  value       = data.aws_ami.ellamma_roboshop.id
}
