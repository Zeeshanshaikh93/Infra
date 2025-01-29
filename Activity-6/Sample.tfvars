region        = "ap-south-1"
vpc_cidr      = "192.168.0.0/16"
network_label = "Ntier"

public_subnets = [
  {
    name              = "app-1"
    cidr              = "192.168.0.0/24"
    availability_zone = "ap-south-1a"
  },
  {
    name              = "app-2"
    cidr              = "192.168.1.0/24"
    availability_zone = "ap-south-1b"
  }
]

private_subnets = [
  {
    name              = "web-1"
    cidr              = "192.168.2.0/24"
    availability_zone = "ap-south-1a"
  },
  {
    name              = "web-2"
    cidr              = "192.168.3.0/24"
    availability_zone = "ap-south-1b"
  }
]

web_security_group = {
  name        = "web_sg"
  description = "This security group is for web servers"
  rules = [
    {
      cidr_ipv4   = "0.0.0.0/0"
      from_port   = 22
      to_port     = 22
      ip_protocol = "tcp"
    },
    {
      cidr_ipv4   = "0.0.0.0/0"
      from_port   = 5000
      to_port     = 5000
      ip_protocol = "tcp"
    }
  ]
}

app_security_group = {
  name        = "app_sg"
  description = "This security group is for application servers"
  rules = [
    {
      cidr_ipv4   = "0.0.0.0/0"
      from_port   = 3306
      to_port     = 3306
      ip_protocol = "tcp"
    }
  ]
}

key_file_details = {
  name = "mypublickeypair"
}

web_server_info = {
  name       = "terraform-ec2"
  ami_filter = {}
  # ami           = "ami-00bb6a80f01f03502"
  instance_type = "t2.micro"
}