[
  {
    "name": "app",
    "image": "${image_url}",
    "essential": true,
    "portMappings": [
      {
        "containerPort": ${container_port},
        "protocol": "tcp"
      }
    ],
    "environment": [
      {
        "name": "APP_ENV",
        "value": "${environment}"
      },
      {
        "name": "APP_VERSION",
        "value": "${app_version}"
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "${log_group_name}",
        "awslogs-region": "${aws_region}",
        "awslogs-stream-prefix": "ecs"
      }
    }
  }
]