variable "name_prefix" {
  type        = string
  description = "Resource name prefix"
}

variable "log_retention_days" {
  type        = number
  description = "CloudWatch log retention days"
}

variable "common_tags" {
  type        = map(string)
  description = "Common resource tags"
}