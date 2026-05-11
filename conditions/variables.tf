variable "ami_id" {
  type        = string
  default     = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
}

# conditions if the environment is dev, create an EC2 instance with a security group that allows all traffic. If the environment is prod, create an EC2 instance with a security group that allows only TLS traffic.
variable "environment" {
    type       = string
    default    = "dev"
}

variable "ec2_tags" {
    type = map
    default = {
        Name = "Terraform-Dev"
        Environment = "dev"
        Project = "Ellamma roboshop"
        Terraform = "True"
    }
}

variable "sg_name" {
  type        = string
  default     = "allow_all"
  description = "Allow all inbound and outbound traffic"
}

variable "protocol" {
  default     = "-1"
}

variable "cidr" {
  type        = list
  default     = ["0.0.0.0/0"]
}

variable "ingress_from_port" {
  default     = 0
}

variable "ingress_to_port" {
  default     = 0
}

variable "egress_to_port" {
  default     = 0
}

variable "egress_from_port" {
    default     = 0
}
