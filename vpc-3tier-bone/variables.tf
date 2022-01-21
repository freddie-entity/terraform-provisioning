variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "ap-southeast-1"
}

variable "environment" {
    description = ""
    type = string
    default = "dev"
}

variable "app_version" {
    description = ""
    type = string
    default = "v1.0"
}

locals {
    environment = var.environment
    app_version = var.app_version

    name = "${var.environment}-${var.app_version}"
}