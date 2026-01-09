terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Creating resource group
resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group
  location = var.location
}

module "az_container_registry" {
  source         = "./modules/az_container_registry"
  name           = "cntaskmanager"
  resource_group = var.resource_group
  location       = var.location
}

module "az_container_app" {
  source         = "./modules/az_container_app"
  app_name       = "taskmanageracr"
  env_name       = "tm-env"
  resource_group = var.resource_group
  location       = var.location
  container_name = "tm-app"
  image          = "${module.az_container_registry.acr_login_server}/tm-app:latest"
  cpu            = 0.25
  memory         = "0.5Gi"

  depends_on = [
    azurerm_resource_group.resource_group
  ]
}

module "role_assignment" {
  source       = "./modules/role_assignment"
  principal_id = module.az_container_app.principal_id
  role_name    = "AcrPull"
  scope        = module.az_container_registry.acr_id
}

# module "network" {
#   source = "./modules/network"
# }

# module "front_door" {
# source = "./modules/front_door"
# }
