# Creating vpc with 4 subnets

resource "aws_vpc" "terra" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "terra"
  }
}

resource "aws_subnet" "web" {
  vpc_id = aws_vpc.terra.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "Web"
  }
  depends_on = [ aws_vpc.terra ]
}

resource "aws_subnet" "web2" {
  vpc_id = aws_vpc.terra.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "web2"
  }
  depends_on = [ aws_vpc.terra ]
} 

resource "aws_subnet" "app1" {
  vpc_id = aws_vpc.terra.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "app1"
  }
  depends_on = [ aws_vpc.terra ]
}

resource "aws_subnet" "app2" {
  vpc_id = aws_vpc.terra.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "app2"
  }
  depends_on = [ aws_vpc.terra ]
}














