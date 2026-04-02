# TF script for making a custom VPC on AWS

# Where to create this resource
provider "aws" {
  # Which region to create it in
  region = var.provider_region

  # terraform init - download required dependencies for that cloud service provider
}

resource "aws_launch_template" "app_lt" {
  name_prefix   = "${var.name_prefix}lt"
  image_id      = var.app_ami_id
  instance_type = var.instance_type

  key_name = var.ssh_key_pair

  vpc_security_group_ids = [var.ssh_http_security_group]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.name_prefix}lt"
    }
  }
}

resource "aws_lb_target_group" "app_tg" {
  name     = "${var.name_prefix}tg"
  port     = 80
  protocol = "HTTP"

  health_check {
    path                = "/"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb" "app_lb" {
  name               = "${var.name_prefix}lb"
  internal           = false # internet-facing
  load_balancer_type = "application"
  security_groups    = [var.ssh_http_security_group]
  subnets            = var.public_subnet_ids
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}

resource "aws_autoscaling_group" "app_asg" {
  name = "${var.name_prefix}asg"

  desired_capacity = 2
  min_size         = 2
  max_size         = 3

  vpc_zone_identifier = var.public_subnet_ids

  health_check_type         = "ELB"
  health_check_grace_period = 90

  launch_template {
    id      = aws_launch_template.app_lt.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.app_tg.arn]

  tag {
    key                 = "Name"
    value               = "${var.name_prefix}app"
    propagate_at_launch = true
  }
}