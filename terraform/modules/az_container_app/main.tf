resource "azurerm_container_app_environment" "app_env" {
  name                = var.env_name
  location            = var.location
  resource_group_name = var.resource_group
}

resource "azurerm_user_assigned_identity" "container_app" {
  name                = "${var.app_name}-identity"
  location            = var.location
  resource_group_name = var.resource_group
}

resource "azurerm_role_assignment" "acr_pull" {
  principal_id         = azurerm_user_assigned_identity.container_app.principal_id
  role_definition_name = "AcrPull"
  scope                = var.acr_id
}

resource "azurerm_container_app" "app" {
  name                         = var.app_name
  container_app_environment_id = azurerm_container_app_environment.app_env.id
  resource_group_name          = var.resource_group
  revision_mode                = "Single"

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.container_app.id]
  }

  registry {
    server   = var.acr_login_server
    identity = azurerm_user_assigned_identity.container_app.id
  }

  template {
    container {
      name  = var.container_name
      image = "${var.acr_login_server}/${var.container_name}:${var.image_tag}"
      #"${module.az_container_registry.acr_login_server}/${container_name}:${tag}latest"
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

  depends_on = [azurerm_role_assignment.acr_pull]
}
