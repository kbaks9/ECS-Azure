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

# 
# module "az_container_app" {
#   source = "./modules/az_container_app"
# }

# module "network" {
#   source = "./modules/network"
# }

module "az_container_registry" {
  source         = "./modules/az_container_registry"
  resource_group = var.resource_group
  location       = var.location
}

## Need to create more modules
