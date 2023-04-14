resource "azurerm_subnet" "web_subnet" {

  name                 = var.web_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet-network.name
  address_prefixes     = var.web_subnet_address
}
resource "azurerm_network_security_group" "NSG-web" {
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  name                = var.NSG-web


}
resource "azurerm_subnet_network_security_group_association" "Web-NSG-association" {
  depends_on = [
    azurerm_network_security_rule.rules-nsg
  ]
  subnet_id                 = azurerm_subnet.web_subnet.id
  network_security_group_id = azurerm_network_security_group.NSG-web.id
}
locals {
  web_nsg_rules = {
    "100" : "22",
    "120" : "80",
    "110" : "443"
  }

}
resource "azurerm_network_security_rule" "rules-nsg" {
  for_each                    = local.web_nsg_rules
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
  network_security_group_name = azurerm_network_security_group.NSG-web.name


}