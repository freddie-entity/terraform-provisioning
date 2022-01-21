locals {
    environment = var.environment
    app_version = var.app_version

    name = "${var.environment}-${var.app_version}"
}