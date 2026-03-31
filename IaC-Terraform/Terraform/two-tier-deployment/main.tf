# TF script for making and deploying an App and DB instace on AWS

# Where to create this resource
provider "aws" {
  # Which region to create it in
  region = var.provider_region

  # terraform init - download required dependencies for that cloud service provider
}

# Which service?
resource "aws_instance" "first_app_instance" {
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
  vpc_security_group_ids = [var.ssh_http_security_group]

  # SSH key pair
  key_name = var.ssh_key_pair

  user_data = templatefile(var.run_app_data_template_path, {
    db_ip = aws_instance.first_db_instance.private_ip
  })
}

resource "aws_instance" "first_db_instance" {
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
  vpc_security_group_ids = [var.ssh_mongodb_security_group]

  # SSH key pair
  key_name = var.ssh_key_pair

  user_data = var.run_db_data
}