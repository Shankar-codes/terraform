variable "instances" {
    default = ["mongodb", "redis", "mysql"]
}

variable "zone_id" {
  type        = string
  default     = "Z00405822WO8HCQACP58A"
}

variable "domain_name" {
   default     = "ellamma.fun"
}
