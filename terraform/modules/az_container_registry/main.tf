# Creating Container Registry
resource "azurerm_container_registry" "acr" {
  name                = var.name
  resource_group_name = var.resource_group
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = false # <-------- Needs to be disabled
}
