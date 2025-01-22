variable "subnets_cidrs" {
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  description = "cidr ranges of subnets"
}

variable "subnets_azs" {
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b", "ap-south-1a", "ap-south-1b"]
  description = "availability zones of subnets"
}

variable "vpc-cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Cidr range for vpc"
}

variable "subnet_names" {
    type = list(string)
    default = [ "web-1", "web-2", "app-1", "app-2" ]
    description = "Names of subnets"
}