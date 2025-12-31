module "network" {
  source      = "./modules/vpc"
  name_prefix = var.name_prefix
  cidr_block  = "10.30.0.0/16"
  az_count    = 2
  tags = { module = "vpc" }
}
output "vpc_id" { value = module.network.vpc_id }
