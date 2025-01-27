resource "aws_security_group" "sg" {
  vpc_id      = aws_vpc.base.id
  name        = var.web_security_group.name
  description = var.web_security_group.description
  tags = {
    name = var.web_security_group.name
  }
  depends_on = [aws_vpc.base]

}

resource "aws_vpc_security_group_ingress_rule" "sg" {
  count             = length(var.web_security_group.rules)
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = var.web_security_group[count.index].cidr_ipv4
  from_port         = var.web_security_group[count.index].from_port
  to_port           = var.web_security_group[count.index].to_port
  ip_protocol       = var.web_security_group[count.index].ip_protocol
}

resource "aws_vpc_security_group_egress_rule" "default" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = local.anywhere
  ip_protocol       = -1
}

resource "aws_vpc_security_group_ingress_rule" "base" {
  count             = length(var.app_security_group.rules)
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = var.app_security_group[count.index].cidr_ipv4
  from_port         = var.app_security_group[count.index].from_port
  to_port           = var.app_security_group[count.index].to_port
  ip_protocol       = var.app_security_group[count.index].ip_protocol
}

resource "aws_vpc_security_group_egress_rule" "appDefault" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = local.anywhere
  ip_protocol       = -1
}