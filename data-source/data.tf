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

data "aws_instance" "Terraform" {
  instance_id = "i-071b9b4d8b2080401"
}

#this output is used to fetch the public ip of the instance created in count module and use it in for-loop module to create route53 record
output "Terraform_public_ip" {
  value       = data.aws_instance.Terraform.public_ip
}
