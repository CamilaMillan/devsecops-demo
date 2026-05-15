data "aws_caller_identity" "current" {}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

locals {
  name_prefix = "${var.project_name}-${var.environment}"

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

//-- ECR

module "ecr" {
  source = "../modules/ecr"

  name_prefix = local.name_prefix
  common_tags = local.common_tags
}

//-- Cloudwatch
module "cloudwatch" {
  source = "../modules/cloudwatch"

  name_prefix        = local.name_prefix
  log_retention_days = var.log_retention_days
  common_tags        = local.common_tags
}

//-- IAM

module "iam" {
  source = "../modules/iam"

  name_prefix = local.name_prefix
  common_tags = local.common_tags
}

//-- ECS
module "ecs" {
  source = "../modules/ecs"

  name_prefix = local.name_prefix
  common_tags = local.common_tags

  cpu            = var.cpu
  memory         = var.memory
  container_port = var.container_port
  environment    = var.environment
  desired_count  = var.desired_count

  ecr_repository_url        = module.ecr.repository_url
  cloudwatch_log_group_name = module.cloudwatch.log_group_name
  ecs_execution_role_arn    = module.iam.ecs_execution_role_arn
  ecs_task_role_arn         = module.iam.ecs_task_role_arn

  subnet_ids            = data.aws_subnets.default.ids
  ecs_security_group_id = module.networking.ecs_security_group_id
  target_group_arn      = module.networking.target_group_arn
}

module "networking" {
  source = "../modules/networking"

  name_prefix = local.name_prefix
  common_tags = local.common_tags

  vpc_id         = data.aws_vpc.default.id
  subnet_ids     = data.aws_subnets.default.ids
  container_port = var.container_port
  account_id     = data.aws_caller_identity.current.account_id

}

