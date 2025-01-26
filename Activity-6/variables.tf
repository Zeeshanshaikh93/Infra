variable "region" {
    type = string
    description = "Region"
    default = "ap-south-1"
}

variable "vpc_cidr" {
    type = string
    description = "vpc cidr"
}

variable "network_label" {
    type = string
    description = "Name of the Network"
    default = "Ntier"
}

variable "public_subnets" {
    type = list(object({
        name = string
        cidr = string
        availability_zone = string
    }))
    description = "Public Subnets"
}

variable "private_subnets" {
    type = list(object({
      name = string
      cidr = string
      availability_zone = string
    }))
    description = "Private Subnets"
}