# Create vpc
# Create an internet gateway
# Create a private route table
# create a public route table
# add route in public route table to internet gateway
# Create subnets for public and associate with public route table
# Create subnets for private and associate with private route table
# create security groups




resource "aws_vpc" "base" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.network_label
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.base.id
  tags = {
    Name = "${var.network_label}-igw"
  }
  depends_on = [aws_vpc.base]
}

resource "aws_route_table" "private" {
  count  = local.private_subnets_count != 0 ? 1 : 0
  vpc_id = aws_vpc.base.id
  tags = {
    Name = "${var.network_label}-Private-RT"
  }
  depends_on = [aws_vpc.base]
}

resource "aws_route_table" "public" {
  count  = local.public_subnets_count != 0 ? 1 : 0
  vpc_id = aws_vpc.base.id
  tags = {
    Name = "${var.network_label}-Public-RT"
  }
  route {
    cidr_block = local.anywhere
    gateway_id = aws_internet_gateway.igw.id
  }
  depends_on = [aws_vpc.base,
  aws_internet_gateway.igw]
}

resource "aws_subnet" "private" {
  count             = local.private_subnets_count
  vpc_id            = aws_vpc.base.id
  cidr_block        = var.private_subnets[count.index].cidr
  availability_zone = var.private_subnets[count.index].availability_zone
  tags = {
    Name = var.private_subnets[count.index].name
  }
}

resource "aws_subnet" "public" {
  count             = local.public_subnets_count
  vpc_id            = aws_vpc.base.id
  cidr_block        = var.public_subnets[count.index].cidr
  availability_zone = var.public_subnets[count.index].availability_zone
  tags = {
    Name = var.public_subnets[count.index].name
  }
}

resource "aws_route_table_association" "private" {
  count          = local.private_subnets_count
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[0].id
}

resource "aws_route_table_association" "public" {
  count          = local.public_subnets_count
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public[0].id
}