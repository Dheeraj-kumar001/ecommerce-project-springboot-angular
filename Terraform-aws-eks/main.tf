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
 
 # Internet Gateway + NAT Gateway
 resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.ecommerce_vpc.id
  tags = { Name = "ecommerce-igw" }
}
resource "aws_eip" "nat" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.ecommerce_subnet1.id
  tags = { Name = "ecommerce-nat" }
}
# Route Tables
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.ecommerce_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = { Name = "public-rt" }
}

resource "aws_route_table_association" "public1_assoc" {
  subnet_id      = aws_subnet.ecommerce_subnet1.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2_assoc" {
  subnet_id      = aws_subnet.ecommerce_subnet2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.ecommerce_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = { Name = "private-rt" }
}

resource "aws_route_table_association" "private1_assoc" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private2_assoc" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private.id
}
resource "aws_security_group" "ecommerce_sg" {
  name        = "ecommerce_sg"
  description = "Allow EKS Cluster communication"
  vpc_id      = aws_vpc.ecommerce_vpc.id

  tags = { 
    Name = "ecommerce_sg"
  }
}

# Allow API server access (kubectl / Terraform)
resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.ecommerce_sg.id
  cidr_ipv4         = "0.0.0.0/0"   # ✅ You can restrict to your IP instead of open to all
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

# Allow node-to-node communication (self)
resource "aws_vpc_security_group_ingress_rule" "allow_nodes" {
  security_group_id = aws_security_group.ecommerce_sg.id
  from_port         = 0
  to_port           = 0
  ip_protocol       = "-1"
  referenced_security_group_id = aws_security_group.ecommerce_sg.id
}

# Allow outbound traffic
resource "aws_vpc_security_group_egress_rule" "allow_all_out" {
  security_group_id = aws_security_group.ecommerce_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 0
  to_port           = 0
  ip_protocol       = "-1"
}

resource "aws_iam_role" "eks_node_role" {
  name = "eks_node_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      },
      {
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"   # ✅ Add this for Node Group
        }
         Action = "sts:AssumeRole"
      }
       
    ]
  })

 
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_node_role.name
}

resource "aws_iam_role_policy_attachment" "eks_cni_policy" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "ec2_container_registry_read_only" {
  role       = aws_iam_role.eks_node_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}
