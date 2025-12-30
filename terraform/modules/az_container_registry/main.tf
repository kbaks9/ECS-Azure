#resource "azurerm_container_registry" "acr" {
#  name                = var.acr_name
#  resource_group_name = var.resource_group_name
#  location            = var.location
#  sku                 = "Basic"
#  admin_enabled       = false
#}

/* # Taken from Terraform HashiCorp site
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_container_registry" "acr" {
  name                = "containerRegistry1"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "Premium"
  admin_enabled       = false
  georeplications {
    location                = "East US"
    zone_redundancy_enabled = true
    tags                    = {}
  }
  georeplications {
    location                = "North Europe"
    zone_redundancy_enabled = true
    tags                    = {}
  }
}*/
