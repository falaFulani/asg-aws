resource "azurerm_virtual_network" "vnet-network" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = var.vnet_address_space

  tags = local.common_tags
}