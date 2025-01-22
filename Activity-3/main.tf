# Creating multiple resources in terraform using Count

resource "aws_vpc" "Dummy" {
  cidr_block = var.vpc-cidr
  tags = {
    Name = "Ntier"
  }
}

resource "aws_subnet" "subnets" {
  count = 4
  vpc_id            = aws_vpc.Dummy.id
  cidr_block        = var.subnets_cidrs[count.index]
  availability_zone = var.subnets_azs[count.index]
  depends_on = [ aws_vpc.Dummy ]
  tags = {
    Name = var.subnet_names[count.index]
  }
}