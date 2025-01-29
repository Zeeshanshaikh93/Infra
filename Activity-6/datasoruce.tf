# Create a datasoruce         
# "It acts like an information about resources that already exists in cloud environment (Fetching the details)"

data "aws_ami" "webimage" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.web_server_info.ami_filter.name]
  }

  owners = [var.web_server_info.ami_filter.owner] # Canonical is a reference to standard practices and guidelines that help users write effective and maintainable infrastructure code.
}
