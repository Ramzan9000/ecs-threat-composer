# Create the Application Load Balancer
resource "aws_lb" "this" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_group_ids
  subnets            = var.subnet_ids

  enable_deletion_protection = false

  tags = {
    Name = var.alb_name
  }
}

# Call Target Group submodule
module "target_group" {
  source       = "./submodules/target_group"
  vpc_id       = var.vpc_id
  name         = var.target_group_name
  port         = var.target_group_port
  protocol     = var.target_group_protocol
  target_type  = "ip"
}

# Call Listener submodule
module "listener" {
  source           = "./submodules/listener"
  alb_arn          = aws_lb.this.arn
  port             = var.listener_port
  protocol         = var.listener_protocol
  target_group_arn = module.target_group.arn
}
