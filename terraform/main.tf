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
  source           = "./modules/az_container_app"
  app_name         = var.app_name
  env_name         = var.env_name
  resource_group   = var.resource_group
  location         = var.location
  acr_id           = module.az_container_registry.acr_id
  container_name   = var.container_name
  acr_login_server = module.az_container_registry.acr_login_server
  image_tag        = var.image_tag
}

module "front_door" {
  source             = "./modules/front_door"
  resource_group     = var.resource_group
  profile_name       = var.profile_name
  sku_name           = var.sku_name
  ep_name            = var.ep_name
  fd_group_name      = var.fd_group_name
  fd_origin_name     = var.fd_origin_name
  fd_route_name      = var.fd_route_name
  origin_host_name   = module.az_container_app.fqdn
  custom_name        = var.custom_name
  custom_domain_name = var.custom_domain_name
}
