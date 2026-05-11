variable "ami_id" {
  type        = string
  default     = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
}

variable "ec2_tags" {
type = map
default = {
  Name = "Terraform-demo"
  Terraform = "True"
  Project = "Ellamma roboshop"
  Environment = "dev"
}
}

variable "sg_name" {
  type        = string
  default     = "allow_all"
  description = "Allow all inbound and outbound traffic"
}

variable "cidr" {
  type        = list
  default     = ["0.0.0.0/0"]
}

variable "ingress_from_port" {
  default = 0
}

variable "ingress_to_port" {
  default = 0
}


variable  "egress_from_port" {
  default = 0
}

variable "egress_in_port" {
    default = 0
}

variable  "protocol" {
  default     = 0
}