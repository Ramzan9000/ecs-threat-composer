

resource "aws_ecs_task_definition" "this" {
  family                   = var.task_name
  container_definitions    = jsonencode([
    {
      name  = var.container_name
      image = var.container_image
      portMappings = [
        {
          containerPort = var.container_port
          protocol      = "tcp"
        }
      ]

      essential = true
    }
  ])

  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = var.execution_role_arn # ✅ reference module variable
  task_role_arn            = var.task_role_arn    # ✅ reference module variable
}
