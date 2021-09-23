resource "aws_vpc" "external_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "External VPC"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.external_vpc.id
  cidr_block              = var.public_subnet[0]
  availability_zone       = var.zones[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-subnet-1a"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.external_vpc.id
  cidr_block              = var.public_subnet[1]
  availability_zone       = var.zones[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-subnet-1b"
  }
}

resource "aws_subnet" "app_private_subnet_1" {
  vpc_id                  = aws_vpc.external_vpc.id
  cidr_block              = var.app_private_subnet[0]
  availability_zone       = var.zones[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "app-private-subnet-1a"
  }
}

resource "aws_subnet" "app_private_subnet_2" {
  vpc_id                  = aws_vpc.external_vpc.id
  cidr_block              = var.app_private_subnet[1]
  availability_zone       = var.zones[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "app-private-subnet-1b"
  }
}

resource "aws_subnet" "db_private_subnet_1" {
  vpc_id            = aws_vpc.external_vpc.id
  cidr_block        = var.db_private_subnet[0]
  availability_zone = var.zones[0]

  tags = {
    Name = "db-private-subnet-1a"
  }
}

resource "aws_subnet" "db_private_subnet_2" {
  vpc_id            = aws_vpc.external_vpc.id
  cidr_block        = var.db_private_subnet[1]
  availability_zone = var.zones[1]

  tags = {
    Name = "db-private-subnet-1b"
  }
}

resource "aws_internet_gateway" "external_igw" {
  vpc_id = aws_vpc.external_vpc.id

  tags = {
    Name = "Externl IGW"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.external_vpc.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.external_igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}

