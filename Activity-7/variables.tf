variable "region" {
  type        = string
  description = "AWS region"
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "network_label" {
  type        = string
  description = "Name of the Network"
  default     = "Ntier"
}

variable "public_subnets" {
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = optional(string, null)
  }))
  description = "List of public subnets with CIDR and availability zone"
}

variable "private_subnets" {
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = optional(string, null)
  }))
  description = "List of private subnets with CIDR and availability zone"
}

variable "web_security_group" {
  type = object({
    name        = optional(string, "web_sg")
    description = optional(string, "This security group is for web servers")
    rules = list(object({
      cidr_ipv4   = optional(string, "0.0.0.0/0")
      from_port   = number
      to_port     = number
      ip_protocol = optional(string, "tcp")
    }))
  })
  description = "This is a web security group"
}

variable "app_security_group" {
  type = object({
    name        = optional(string, "app_sg")
    description = optional(string, "This security group is for application servers")
    rules = list(object({
      cidr_ipv4   = optional(string, "0.0.0.0/0")
      from_port   = number
      to_port     = number
      ip_protocol = optional(string, "tcp")
    }))
  })
  description = "This is an application security group"
}

variable "key_file_details" {
  type = object({
    name             = string
    public_key_path  = optional(string, "~/.ssh/id_ed25519.pub")
    private_key_path = optional(string, "~/.ssh/id_ed25519")
  })
}

variable "web_server_info" {
  type = object({
    #name                        = string
    #ami                         = optional(string, "ami-00bb6a80f01f03502")
    name = string
    ami_filter = object({
      name  = optional(string, "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*")
      owner = optional(string, "099720109477")
    })
    instance_type       = optional(string, "t2.micro")
    associate_public_ip = optional(bool, true)
    username            = optional(string, "ubuntu")

  })
}

variable "build_id" {
  type    = string
  default = ""
}