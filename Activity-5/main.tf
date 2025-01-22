# Creating vpc with private and public subnets

resource "aws_vpc" "base" {
    cidr_block = "10.10.0.0/16"
    tags = {
      Name = "Ntier"
    }  
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.base.id
    tags = {
      Name = "Ntier-igw"
    }
    depends_on = [ aws_vpc.base ]
}

resource "aws_route_table" "private" {
    vpc_id = aws_vpc.base.id
    tags = {
      Name = "Private-RT"
    }
    depends_on = [ aws_vpc.base ]
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.base.id
    tags = {
      Name = "Public-RT"
    }
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    depends_on = [ aws_vpc.base,
                   aws_internet_gateway.igw ]
}

resource "aws_subnet" "private" {
    vpc_id = aws_vpc.base.id
    cidr_block = "10.10.0.0/24"
    availability_zone = "ap-south-1a"
    tags = {
      Name = "Web"
    }
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.base.id
    cidr_block = "10.10.1.0/24"
    availability_zone = "ap-south-1b"
    tags = {
      Name = "App"
    }
}

resource "aws_route_table_association" "private" {
    subnet_id = aws_subnet.private.id
    route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public.id
}