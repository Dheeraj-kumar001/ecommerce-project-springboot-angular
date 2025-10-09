resource "aws_security_group" "ecommerce_sg" {
  name        = "ecommerce_sg"
  description = "Allow EKS Cluster communication"
  vpc_id      = aws_vpc.ecommerce_vpc.id
  tags = { Name = "ecommerce_sg" }
}

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.ecommerce_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allow_nodes" {
  security_group_id            = aws_security_group.ecommerce_sg.id
  from_port                    = 0
  to_port                      = 0
  ip_protocol                  = "-1"
  referenced_security_group_id = aws_security_group.ecommerce_sg.id
}

resource "aws_vpc_security_group_egress_rule" "allow_all_out" {
  security_group_id = aws_security_group.ecommerce_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 0
  to_port           = 0
  ip_protocol       = "-1"
}
