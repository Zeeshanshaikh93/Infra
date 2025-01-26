locals {
  anywhere = "0.0.0.0/0"
  public_subnets_count = length(var.public_subnets)
  private_subnets_count = length(var.private_subnets)
}