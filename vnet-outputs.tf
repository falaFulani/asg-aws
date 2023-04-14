#virtual Network Name
output "virtual_network_name" {
  description = "Virtual Network  Name"
  value = azurerm_virtual_network.vnet-network.name
}
# Virtual Network ID 

output "virtual_network_ID" {
  description = "ID of the Vnet"
  value = azurerm_virtual_network.vnet-network.id
}

#Out put for the web subnets
output "web_subnet_name" {
    description = "WebTier Subnet Name"
  value = azurerm_subnet.web_subnet.name
  
}

output "web_subnet_id" {
    description = "WebTier Subnet ID"
  value = azurerm_subnet.web_subnet.id
  
}
#Out put for the db subnets
output "db_subnet_name" {
    description = "WebTier Subnet Name"
  value = azurerm_subnet.db_subnet.name
  
}

output "db_subnet_id" {
    description = "WebTier Subnet ID"
  value = azurerm_subnet.db_subnet.id
  
}
