module "vpc" {
  source = "../../modules/network"
  
  vpc_cidr = "10.0.0.0/16"
  env_name = "mock"
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
