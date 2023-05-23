# Create an elastic IP for nat
resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Name = "staging-nat"
  }
}

# Nat should be place to public subnet
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_us_east1a.id

  tags = {
    Name = "staging-nat"
  }
  depends_on = [aws_internet_gateway.igw]
}