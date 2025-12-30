output "container_registry_id" {
    value = azurerm_container_registry.acr.id
}

output "container_registry_login_server" {
    value = azurerm_container_registry.acr.login_server
}