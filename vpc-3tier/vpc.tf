module "custom-vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.78.0"

  name             = "${local.name}"
  cidr             = "10.0.0.0/16"
  azs              = ["ap-southeast-1a", "ap-southeast-1b"]
  private_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets   = ["10.0.101.0/24", "10.0.102.0/24"]
  database_subnets = ["10.0.151.0/24", "10.0.152.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    Type = "public-subnet"
  }
  private_subnet_tags = {
    Type = "private-subnet"
  }
  database_subnet_tags = {
    Type = "database-subnet"
  }

  tags = {
    Name        = "vpc-tf-module"
    Environment = "Dev"
  }
}