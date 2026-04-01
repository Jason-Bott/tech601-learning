# TF script for making a custom VPC on AWS

# Where to create this resource
provider "aws" {
  # Which region to create it in
  region = var.provider_region

  # terraform init - download required dependencies for that cloud service provider
}

#
# VPC
#

resource "aws_vpc" "custom_vpc" {
  cidr_block = var.IPv4_CIDR

  tags = {
    Name = "${var.name_prefix}vpc"
  }
}

# Public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.custom_vpc.id

  cidr_block = var.public_CIDR

  availability_zone = "${var.provider_region}a"

  map_public_ip_on_launch = true

  tags = {
    Name = "${var.name_prefix}public-subnet"
  }
}

# Private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.custom_vpc.id

  cidr_block = var.private_CIDR

  availability_zone = "${var.provider_region}b"

  tags = {
    Name = "${var.name_prefix}private-subnet"
  }
}

# Internet gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    Name = "${var.name_prefix}ig"
  }
}

# Route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    Name = "${var.name_prefix}public-rt"
  }
}

resource "aws_route" "public_internet_access" {
  route_table_id = aws_route_table.public_rt.id

  destination_cidr_block = var.anywhere

  gateway_id = aws_internet_gateway.internet_gateway.id
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id = aws_subnet.public_subnet.id

  route_table_id = aws_route_table.public_rt.id
}

#
# Security Groups
#

# App
resource "aws_security_group" "app_sg" {
  name        = "${var.name_prefix}allow-ssh-http"
  description = "Allow SSH and HTTP"

  vpc_id = aws_vpc.custom_vpc.id

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

# Database
resource "aws_security_group" "db_sg" {
  name        = "${var.name_prefix}allow-mongodb"
  description = "Allow mongodb"

  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    Name = "${var.name_prefix}allow-mongodb"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_mongodb" {
  security_group_id = aws_security_group.db_sg.id
  ip_protocol       = "tcp"

  description = "MongoDB"
  from_port   = 27017
  to_port     = 27017

  referenced_security_group_id = aws_security_group.app_sg.id
}

#
# Instances
#

resource "aws_instance" "app_instance" {
  # Which AMI?
  ami = var.app_ami_id

  # What instance type?
  instance_type = var.instance_type

  # Do we want a public IP address?
  associate_public_ip_address = true

  # Name of resource
  tags = {
    Name = "${var.name_prefix}app"
  }

  # Security groups
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  # Subnet
  subnet_id = aws_subnet.public_subnet.id

  # SSH key pair
  key_name = var.ssh_key_pair

  user_data = templatefile(var.run_app_data_template_path, {
    db_ip = aws_instance.db_instance.private_ip
  })
}

resource "aws_instance" "db_instance" {
  # Which AMI?
  ami = var.db_ami_id

  # What instance type?
  instance_type = var.instance_type

  # Do we want a public IP address?
  associate_public_ip_address = false

  # Name of resource
  tags = {
    Name = "${var.name_prefix}db"
  }

  # Security groups
  vpc_security_group_ids = [aws_security_group.db_sg.id]

  # Subnet
  subnet_id = aws_subnet.private_subnet.id

  # SSH key pair
  key_name = var.ssh_key_pair

  user_data = var.run_db_data
}