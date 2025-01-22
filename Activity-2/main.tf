resource "aws_vpc" "Dummy" {
  cidr_block = var.vpc-cidr
  tags = {
    Name = "Ntier"
  }
}

resource "aws_subnet" "web1" {
  vpc_id            = aws_vpc.Dummy.id
  cidr_block        = var.subnets_cidrs[0]
  availability_zone = var.subnets_azs[0]
  tags = {
    Name = "web1"
  }
}

resource "aws_subnet" "web2" {
  vpc_id            = aws_vpc.Dummy.id
  cidr_block        = var.subnets_cidrs[1]
  availability_zone = var.subnets_azs[1]
  tags = {
    Name = "web2"
  }
}

resource "aws_subnet" "app1" {
  vpc_id            = aws_vpc.Dummy.id
  cidr_block        = var.subnets_cidrs[2]
  availability_zone = var.subnets_azs[2]
  tags = {
    Name = "app1"
  }
}

resource "aws_subnet" "app2" {
  vpc_id            = aws_vpc.Dummy.id
  cidr_block        = var.subnets_cidrs[3]
  availability_zone = var.subnets_azs[3]
  tags = {
    Name = "app2"
  }
}




