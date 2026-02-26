resource "azurerm_user_assigned_identity" "container_app" {
  name                = var.identity_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_role_assignment" "acr_pull" {
  principal_id         = azurerm_user_assigned_identity.container_app.principal_id
  role_definition_name = "AcrPull"
  scope                = var.scope
}
