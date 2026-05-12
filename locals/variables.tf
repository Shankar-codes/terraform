variable "project" {
  default     = "ellamma-roboshop"
}

variable "environment" {
  default     = "environment"
}

variable "instance_type" {
  default     = "t3.micro"
}

variable "common_tags" {
  type        = map
  default     = {
    Terraform="true"
    Project="ellamma-roboshop"
    Environment="dev"
  }
}
