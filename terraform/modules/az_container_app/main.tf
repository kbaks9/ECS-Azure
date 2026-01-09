resource "azurerm_container_app_environment" "app_env" {
  name                = var.env_name
  location            = var.location
  resource_group_name = var.resource_group
}

resource "azurerm_container_app" "app" {
  name                         = var.app_name
  container_app_environment_id = azurerm_container_app_environment.app_env.id
  resource_group_name          = var.resource_group
  revision_mode                = "Single"

  identity {
    type = "SystemAssigned" # <-- System Assigned identity
  }

  template {
    container {
      name   = var.container_name
      image  = var.image
      cpu    = var.cpu
      memory = var.memory
    }
  }

  ingress {
    external_enabled = true
    target_port      = 8080
    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }
}
