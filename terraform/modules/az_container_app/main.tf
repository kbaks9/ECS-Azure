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
    type         = "UserAssigned"
    identity_ids = [var.identity_id]
  }

  registry {
    server   = var.acr_login_server
    identity = var.identity_id
  }

  template {
    container {
      name   = var.container_name
      image  = "${var.acr_login_server}/${var.container_name}:${var.image_tag}"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }

  ingress {
    external_enabled = true
    target_port      = 8080
    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }

  #  depends_on = [azurerm_role_assignment.acr_pull]
}
