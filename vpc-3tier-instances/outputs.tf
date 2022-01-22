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


output "public_bastion_security_group_name" {
  description = ""
  value       = module.public-bastion-sg.security_group_name
}

output "private_security_group_name" {
  description = ""
  value       = module.private-sg.security_group_name
}

output "ec2-instance-bastion-ip" {
  description = ""
  value       = module.ec2-instance-bastion.public_ip
}

output "ec2-instance-private-ip" {
  description = ""
  value       = module.ec2-instance-private.private_ip
}