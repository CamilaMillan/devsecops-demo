variable "aws_region" {
  type        = string
  description = "AWS region"
}

variable "project_name" {
  type        = string
  description = "Project name"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "container_port" {
  type        = number
  description = "Application container port"
}

variable "desired_count" {
  type        = number
  description = "Number of ECS tasks"
}

variable "cpu" {
  type        = number
  description = "ECS task CPU"
}

variable "memory" {
  type        = number
  description = "ECS task memory"
}

variable "log_retention_days" {
  type        = number
  description = "CloudWatch log retention days"
}