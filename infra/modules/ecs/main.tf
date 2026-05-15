resource "aws_ecs_cluster" "this" {
  name = "${var.name_prefix}-cluster"

  tags = var.common_tags
}


resource "aws_ecs_task_definition" "this" {
  family                   = "${var.name_prefix}-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"

  cpu    = tostring(var.cpu)
  memory = tostring(var.memory)

  execution_role_arn = var.ecs_execution_role_arn
  task_role_arn      = var.ecs_task_role_arn

  container_definitions = templatefile(
  "${path.module}/definitions/ecs-container-definition.json.tpl",
  {
    image_url        = "${var.ecr_repository_url}:1.0.0"
    container_port   = var.container_port
    environment      = var.environment
    log_group_name   = var.cloudwatch_log_group_name
    aws_region       = "us-east-1"
    app_version      = "1.0.0"
  }
)

  tags = var.common_tags
}


resource "aws_ecs_service" "this" {
  name            = "${var.name_prefix}-service"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.this.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200

  network_configuration {
    subnets          = var.subnet_ids
    security_groups  = [var.ecs_security_group_id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "app"
    container_port   = var.container_port
  }

  depends_on = [
    aws_ecs_task_definition.this
  ]

  tags = var.common_tags
}