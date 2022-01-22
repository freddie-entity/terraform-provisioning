module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.78.0"

  name             = local.name
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
    Type = "public-subnet-${local.name}"
    Name = "public-subnet-${local.name}"
  }
  private_subnet_tags = {
    Type = "private-subnet-${local.name}"
    Name = "private-subnet-${local.name}"
  }
  database_subnet_tags = {
    Type = "database-subnet-${local.name}"
    Name = "database-subnet-${local.name}"
  }

  database_route_table_tags = {
    Name = "db-subnet-rt-${local.name}"
  }
  private_route_table_tags = {
    Name = "pvt-subnet-rt-${local.name}"
  }

  public_route_table_tags = {
    Name = "pub-subnet-rt-${local.name}"
  }

  igw_tags = {
    Name = "igw-${local.name}"
  }

  tags = local.general_tags
}