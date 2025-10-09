resource "aws_vpc" "ecommerce_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = { 
    Name = "ecommerce-vpc" 
  }
}

# Public Subnets (for ALB/Internet access)

resource "aws_subnet" "ecommerce_subnet1" {
  vpc_id            = aws_vpc.ecommerce_vpc.id
  cidr_block        = var.public_subnet1_cidr 
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = true
  tags = { 
    Name = "ecommerce-subnet1" 
  }
}

resource "aws_subnet" "ecommerce_subnet2" {
  vpc_id            = aws_vpc.ecommerce_vpc.id
  cidr_block        = var.public_subnet2_cidr
  availability_zone = "us-east-2b"
  map_public_ip_on_launch = true
  tags = { 
    Name = "ecommerce-subnet2" 
  }
}
# Private Subnets (for worker nodes)
resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.ecommerce_vpc.id
  cidr_block        = var.private_subnet1_cidr
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = false
  tags = { Name = "private-subnet1" }
}
resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.ecommerce_vpc.id
  cidr_block        = var.private_subnet2_cidr
  availability_zone = "us-east-2b"
  map_public_ip_on_launch = false
  tags = { Name = "private-subnet2" }
}
 