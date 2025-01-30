locals {
  private_subnets_count = length(var.private_subnets)
  public_subnets_count  = length(var.public_subnets)
  anywhere              = "0.0.0.0/0"
}