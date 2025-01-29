resource "aws_instance" "web" {
  ami = data.aws_ami.webimage.id
  # ami                         = var.web_server_info.ami
  instance_type               = var.web_server_info.instance_type
  associate_public_ip_address = var.web_server_info.associate_public_ip
  key_name                    = aws_key_pair.base.key_name
  tags = {
    Name = var.web_server_info.name
  }
  subnet_id = aws_subnet.public[0].id
  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]
  depends_on = [aws_subnet.public,
    aws_security_group.web_sg,
    aws_key_pair.base,
  data.aws_ami.webimage]
}