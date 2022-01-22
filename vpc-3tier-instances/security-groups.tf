module "public-bastion-sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.8.0"

  name        = "public-bastion-sg-${local.name}"
  description = "public-bastion-sg-${local.name}"
  vpc_id      = module.vpc.vpc_id

  ingress_rules       = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  egress_rules       = ["all-all"]
  egress_cidr_blocks = ["0.0.0.0/0"]

  tags = local.general_tags
}

module "private-sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.8.0"

  name        = "private-sg-${local.name}"
  description = "private-sg-${local.name}"
  vpc_id      = module.vpc.vpc_id

  ingress_rules       = ["ssh-tcp","http-80-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]

  egress_rules       = ["all-all"]
  egress_cidr_blocks = ["0.0.0.0/0"]

  tags = local.general_tags
}