variable "subnets_info" {
    type = list(object({
        name = string
        cidr = string
        availability_zone = string
    }))
  
}

variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
  
}