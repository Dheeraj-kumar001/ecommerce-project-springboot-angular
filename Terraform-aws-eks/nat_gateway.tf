# Create  a Nat Gatway for the public subnets to allow outbound internet access for private subnets 
resource "aws_eip" "nat" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.ecommerce_subnet1.id
  tags = { Name = "ecommerce-nat" }
}
