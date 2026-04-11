resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group
  address_space       = [var.virtual_network_address_space]
  tags                = var.tags
}

resource "azurerm_subnet" "containerapps_subnet" {
  name                 = var.container_app_subnet_name
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.container_app_subnet_prefix]

  /*
  Remove multicomment to connect Container Env App to VNet
  Requires an upgrade to premium front door (I'm using free tier)
  delegation {
    name = "container-apps-delegation"
    service_delegation {
      name = "Microsoft.App/environments"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action"
      ]
    }
  }*/
}
