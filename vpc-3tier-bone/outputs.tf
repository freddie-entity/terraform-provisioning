output "vpc_id" {
  description = ""
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = ""
  value       = module.vpc.vpc_cidr_block
}

output "private_subnets" {
  description = ""
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = ""
  value       = module.vpc.public_subnets
}

output "database_subnets" {
  description = ""
  value       = module.vpc.database_subnets
}

output "nat_public_ips" {
  description = ""
  value       = module.vpc.nat_public_ips
}

output "azs" {
  description = ""
  value       = module.vpc.azs
}