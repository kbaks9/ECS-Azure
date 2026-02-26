output "acr_pull" {
  value = azurerm_role_assignment.acr_pull
}

output "identity_id" {
  value = azurerm_user_assigned_identity.container_app.id
}
