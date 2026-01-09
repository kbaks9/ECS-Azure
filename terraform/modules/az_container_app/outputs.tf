output "principal_id" {
  value = azurerm_container_app.app.identity[0].principal_id
}
