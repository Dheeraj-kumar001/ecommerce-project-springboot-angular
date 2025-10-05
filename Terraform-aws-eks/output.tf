# VPC ID
output "vpc_id" {
  value = aws_vpc.ecommerce_vpc.id
}

# Subnets IDs
output "subnet1_id" {
  value = aws_subnet.ecommerce_subnet1.id
}

output "subnet2_id" {
  value = aws_subnet.ecommerce_subnet2.id
}

# Security Group ID
output "security_group_id" {
  value = aws_security_group.ecommerce_sg.id
}

# EKS Cluster Name
output "eks_cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}

# EKS Cluster Endpoint (API server ka URL)
output "eks_cluster_endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

# EKS Cluster Certificate Authority
output "eks_cluster_certificate" {
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

# Node Group Name
output "node_group_name" {
  value = aws_eks_node_group.node_group.node_group_name
}


































