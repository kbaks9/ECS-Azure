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
  name     = local.resource_group
  location = local.location
}

module "az_container_registry" {
  source         = "./modules/az_container_registry"
  name           = "cntaskmanager"
  resource_group = local.resource_group
  location       = local.location
}

module "az_container_app" {
  source           = "./modules/az_container_app"
  app_name         = local.app_name
  env_name         = local.env_name
  resource_group   = local.resource_group
  location         = local.location
  acr_id           = module.az_container_registry.acr_id
  container_name   = local.container_name
  acr_login_server = module.az_container_registry.acr_login_server
  image_tag        = local.image_tag
}

# module "network" {
#   source = "./modules/network"
# }

module "front_door" {
  source             = "./modules/front_door"
  resource_group     = local.resource_group
  origin_host_name   = module.az_container_app.fqdn
  custom_name        = "kbakar-site"
  custom_domain_name = "kbakar.site"
}
