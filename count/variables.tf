variable instances {
  type        = list
  default     = ["mongodb", "redis", "mysql"]
  description = "List of instance names"
}

variable "zone_id" {
  type        = string
  default     = "Z00405822WO8HCQACP58A"
}

variable "domain_name" {
  type        = string
  default     = "ellamma.fun"
}

variable "ami_id" {
  type        = string
  default     = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
}

variable "sg_name" {
  type        = string
  default     = "allow_all"
  description = "Allow all inbound and outbound traffic"
}

variable "protocol" {
  default     = -1
}

variable "cidr" {
  type        = list
  default     = ["0.0.0.0/0"]
}

variable "ingress_to_port" {
  default     = 0
}

variable "ingress_from_port" {
  default     = 0
}

variable "egress_to_port" {
  default     = 0
}

variable "egress_from_port" {
  default     = 0
}
