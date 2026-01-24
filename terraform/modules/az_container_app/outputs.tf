output "principal_id" {
  value = azurerm_container_app.app.identity[0].principal_id
}

output "app_id" {
  value = azurerm_container_app.app.id
}

output "fqdn" {
  description = "Container App FQDN"
  value       = azurerm_container_app.app.ingress[0].fqdn
}
