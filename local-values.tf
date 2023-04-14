locals {
  owners        = var.organization
  enviroment    = var.enviroment
  resource_name = "${var.organization}-${var.enviroment}"
  common_tags = {
    owners = local.owners,
    env    = local.enviroment
  }
}