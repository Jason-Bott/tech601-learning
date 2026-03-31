# TF script for making a Security Group on AWS

# Where to create this resource
provider "aws" {
  # Which region to create it in
  region = var.provider_region

  # terraform init - download required dependencies for that cloud service provider
}

resource "aws_security_group" "app_sg" {
  name        = "${var.name_prefix}allow-ssh-http"
  description = "Allow SSH and HTTP"

  tags = {
    Name = "${var.name_prefix}allow-ssh-http"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.app_sg.id
  ip_protocol       = "tcp"

  description = "SSH"
  from_port   = 22
  to_port     = 22
  cidr_ipv4   = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.app_sg.id
  ip_protocol       = "tcp"

  description = "HTTP"
  from_port   = 80
  to_port     = 80
  cidr_ipv4   = "0.0.0.0/0"
}