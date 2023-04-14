resource "azurerm_subnet" "bastion_subnet" {
  name = var.bastion_subnet_name
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet-network.name
  address_prefixes = var.bastion_subnet_address
}
resource "azurerm_network_security_group" "NSG-bastion" {
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    name = var.NSG-bastion
  
}

resource "azurerm_subnet_network_security_group_association" "bastion-NSG-association" {
 depends_on = [
   azurerm_network_security_rule.rules-nsg-bastion
 ]
 
 subnet_id = azurerm_subnet.bastion_subnet.id
 network_security_group_id = azurerm_network_security_group.NSG-bastion.id 
}
locals {
  bastion_nsg_rules = {
    "100" : "80"
    "110" : "3389"
  }
}
resource "azurerm_network_security_rule" "rules-nsg-bastion" {
  for_each                    = local.bastion_nsg_rules
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
  network_security_group_name = azurerm_network_security_group.NSG-bastion.name
}