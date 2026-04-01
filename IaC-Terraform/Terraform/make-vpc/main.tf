# TF script for making a custom VPC on AWS

# Where to create this resource
provider "aws" {
  # Which region to create it in
  region = var.provider_region

  # terraform init - download required dependencies for that cloud service provider
}

# VPC
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