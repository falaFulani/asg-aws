resource "azurerm_resource_group" "rg" {
  name     = "${local.resource_name}-${random_string.random.id}"
  tags     = local.common_tags
  location = var.resource_group_location
}