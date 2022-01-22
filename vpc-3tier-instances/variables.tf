## === ** Variables ** === ##

variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "ap-southeast-1"
}

variable "environment" {
  description = ""
  type        = string
  default     = "dev"
}

variable "app_version" {
  description = ""
  type        = string
  default     = "v1.0"
}

variable "instance_type" {
  description = ""
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = ""
  type        = string
  default     = "tf-kp"
}

## === ** Local ** === ##

locals {
  environment = var.environment
  app_version = var.app_version

  name = "${var.environment}-${var.app_version}"

  general_tags = {
    Name        = "vpc-${local.name}"
    Environment = "${local.environment}"
    AppVersion  = "${local.app_version}"
  }
}


## === ** Data ** === ##
data "aws_ami" "amzlinux2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
