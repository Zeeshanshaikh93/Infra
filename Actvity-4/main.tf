# Creating multiple resources in terraform using Count

resource "aws_vpc" "Dummy" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "Ntier"
  }
}

resource "aws_subnet" "subnets" {
  count = length(var.subnets_info)
  vpc_id            = aws_vpc.Dummy.id
  cidr_block        = var.subnets_info[count.index].cidr
  availability_zone = var.subnets_info[count.index].availability_zone
  depends_on = [ aws_vpc.Dummy ]
  tags = {
    Name = var.subnets_info[count.index].name
  }
}