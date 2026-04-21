resource "azurerm_container_app_environment" "app_env" {
  name                = var.env_name
  location            = var.location
  resource_group_name = var.resource_group

  /* Remove multicomment to connect Container Env App to VNet */
  infrastructure_subnet_id       = var.subnet_id
  internal_load_balancer_enabled = true

  workload_profile {
    name                  = "wp"
    workload_profile_type = "D4"
  }
  tags = var.tags
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
      cpu    = var.int_cpu
      memory = var.int_memory
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
  tags = var.tags
}
