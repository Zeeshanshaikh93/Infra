variable "region" {
  type        = string
  description = "Region"
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  type        = string
  description = "vpc cidr"
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
    availability_zone = string
  }))
  description = "Public Subnets"
}

variable "private_subnets" {
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = string
  }))
  description = "Private Subnets"
}

variable "web_security_group" {
  type = object({
    name        = optional(string, "web_sg")
    description = optional(string, "This security group is for web server")
    rules = list(object({
      cidr_ipv4   = optional(string, "0.0.0.0/0")
      from_port   = number
      to_port     = number
      ip_protocol = optional(string, "tcp")
    }
    ))
  })
  description = "This is a web secruity group"
}

variable "app_security_group" {
  type = list(object({
    name        = optional(string, "app_sg")
    description = optional(string, "This security group is for app server")
    rules = list(object({
      cidr_ipv4   = optional(string, "0.0.0.0/0")
      from_port   = number
      to_port     = number
      ip_protocol = optional(string, "tcp")
    }))
  }))
  description = "This is a app secruity group"
}