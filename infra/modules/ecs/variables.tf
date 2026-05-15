variable "name_prefix" {
  type        = string
  description = "Resource name prefix"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags"
}

variable "cpu" {
  type        = number
  description = "Task CPU"
}

variable "memory" {
  type        = number
  description = "Task memory"
}

variable "container_port" {
  type        = number
  description = "Application port"
}

variable "ecr_repository_url" {
  type        = string
  description = "Container image repository"
}

variable "cloudwatch_log_group_name" {
  type        = string
  description = "CloudWatch log group"
}

variable "ecs_execution_role_arn" {
  type        = string
  description = "Execution role ARN"
}

variable "ecs_task_role_arn" {
  type        = string
  description = "Task role ARN"
}

variable "environment" {
  type        = string
  description = "Deployment environment"
}

variable "desired_count" {
  type        = number
  description = "Desired number of ECS tasks"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for ECS service"
}

variable "ecs_security_group_id" {
  type        = string
  description = "Security group ID for ECS tasks"
}

variable "target_group_arn" {
  type        = string
  description = "ALB target group ARN"
}