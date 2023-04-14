resource "azurerm_subnet" "app_subnet" {
  name                 = var.app_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet-network.name
  address_prefixes     = var.app_subnet_address
}

resource "azurerm_network_security_group" "NSG-app" {
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  name                = var.NSG-app
}

resource "azurerm_subnet_network_security_group_association" "app-NSG-association" {
  depends_on = [
    azurerm_network_security_rule.rules-nsg-app
  ]
  subnet_id                 = azurerm_subnet.app_subnet.id
  network_security_group_id = azurerm_network_security_group.NSG-app.id
}
locals {
  app_nsg_rules = {
    "100" : "8080",
    "110" : "80",
    "120" : "443",
    "130" : "22"
  }
}
resource "azurerm_network_security_rule" "rules-nsg-app" {
  for_each                    = local.app_nsg_rules
  name                        = "NSG-Rule-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.NSG-app.name
}