output "aws_account_id" {
  description = "AWS account ID"
  value       = data.aws_caller_identity.current.account_id
}

output "ecr_repository_url" {
  description = "ECR repository URL used by the CI/CD pipeline"
  value       = module.ecr.repository_url
}

output "ecr_repository_name" {
  description = "ECR repository name"
  value       = module.ecr.repository_name
}

output "cloudwatch_log_group_name" {
  description = "CloudWatch log group for ECS application logs"
  value       = module.cloudwatch.log_group_name
}

output "ecs_execution_role_arn" {
  description = "ECS execution role ARN"
  value       = module.iam.ecs_execution_role_arn
}

output "ecs_task_role_arn" {
  description = "ECS task role ARN"
  value       = module.iam.ecs_task_role_arn
}

output "ecs_cluster_name" {
  description = "ECS cluster name"
  value       = module.ecs.ecs_cluster_name
}

output "ecs_cluster_arn" {
  description = "ECS cluster ARN"
  value       = module.ecs.ecs_cluster_arn
}

output "ecs_task_definition_arn" {
  description = "ECS task definition ARN"
  value       = module.ecs.ecs_task_definition_arn
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS"
  value       = module.networking.alb_dns_name
}

output "alb_security_group_id" {
  description = "ALB security group"
  value       = module.networking.alb_security_group_id
}

output "ecs_security_group_id" {
  description = "ECS security group"
  value       = module.networking.ecs_security_group_id
}

output "target_group_arn" {
  description = "Target group ARN"
  value       = module.networking.target_group_arn
}

output "ecs_service_name" {
  description = "ECS service name"
  value       = module.ecs.ecs_service_name
}