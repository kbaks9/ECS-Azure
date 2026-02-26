output "subnet_id" {
  description = "ID of the subnet for the Container App Environment"
  value       = azurerm_subnet.containerapps_subnet.id
}

output "vnet_id" {
  description = "ID of the virtual network"
  value       = azurerm_virtual_network.vnet.id
}
