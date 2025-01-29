# Web Security Group
resource "aws_security_group" "web_sg" {
  vpc_id      = aws_vpc.base.id
  name        = var.web_security_group.name
  description = var.web_security_group.description
  tags = {
    Name = var.web_security_group.name
  }
  depends_on = [aws_vpc.base]
}

resource "aws_vpc_security_group_ingress_rule" "web_sg" {
  count             = length(var.web_security_group.rules)
  security_group_id = aws_security_group.web_sg.id
  cidr_ipv4         = var.web_security_group.rules[count.index].cidr_ipv4
  from_port         = var.web_security_group.rules[count.index].from_port
  to_port           = var.web_security_group.rules[count.index].to_port
  ip_protocol       = var.web_security_group.rules[count.index].ip_protocol
}

resource "aws_vpc_security_group_egress_rule" "web_default" {
  security_group_id = aws_security_group.web_sg.id
  cidr_ipv4         = local.anywhere
  ip_protocol       = "-1"
}

# App Security Group
resource "aws_security_group" "app_sg" {
  vpc_id      = aws_vpc.base.id
  name        = var.app_security_group.name
  description = var.app_security_group.description
  tags = {
    Name = var.app_security_group.name
  }
  depends_on = [aws_vpc.base]
}

resource "aws_vpc_security_group_ingress_rule" "app_sg" {
  count             = length(var.app_security_group.rules)
  security_group_id = aws_security_group.app_sg.id
  cidr_ipv4         = var.app_security_group.rules[count.index].cidr_ipv4
  from_port         = var.app_security_group.rules[count.index].from_port
  to_port           = var.app_security_group.rules[count.index].to_port
  ip_protocol       = var.app_security_group.rules[count.index].ip_protocol
}

resource "aws_vpc_security_group_egress_rule" "app_default" {
  security_group_id = aws_security_group.app_sg.id
  cidr_ipv4         = local.anywhere
  ip_protocol       = "-1"
}

# Import Aws Public keypair
resource "aws_key_pair" "base" {
  key_name   = var.key_file_details.name
  public_key = file(var.key_file_details.public_key_path)


}

