variable "name_prefix" {
  type        = string
  description = "Resource name prefix"
}

variable "common_tags" {
  type        = map(string)
  description = "Common resource tags"
}