resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr
  availability_zone = var.availability_zones
  tags = {
    Name = "${var.vpc_name}-public"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr
  availability_zone = var.availability_zones
  tags = {
    Name = "${var.vpc_name}-private"
  }
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_route_table_association" "public" {
  subnet_id     = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  subnet_id     = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}