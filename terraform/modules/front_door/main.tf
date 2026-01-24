# Front Door Profile
resource "azurerm_cdn_frontdoor_profile" "fd_profile" {
  name                = local.profile_name
  resource_group_name = var.resource_group
  sku_name            = local.sku_name
}

# Front Door Endpoint
resource "azurerm_cdn_frontdoor_endpoint" "fd_endpoint" {
  name                     = local.ep_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.fd_profile.id
}

# Origin Group
resource "azurerm_cdn_frontdoor_origin_group" "fd_origin_group" {
  name                     = local.fd_group_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.fd_profile.id

  health_probe {
    interval_in_seconds = 120
    path                = "/"
    protocol            = "Https"
    request_type        = "GET"
  }

  load_balancing {
    sample_size                 = 4
    successful_samples_required = 3
  }
}

# Origin
resource "azurerm_cdn_frontdoor_origin" "fd_origin" {
  name                           = local.fd_origin_name
  cdn_frontdoor_origin_group_id  = azurerm_cdn_frontdoor_origin_group.fd_origin_group.id
  enabled                        = true
  certificate_name_check_enabled = true

  host_name          = var.origin_host_name
  http_port          = 80
  https_port         = 443
  origin_host_header = var.origin_host_name
  priority           = 1
  weight             = 1000
}

# Route
resource "azurerm_cdn_frontdoor_route" "fd_route" {
  name                          = local.fd_route_name
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.fd_endpoint.id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.fd_origin_group.id
  cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.fd_origin.id]
  enabled                       = true
  forwarding_protocol           = "MatchRequest"
  https_redirect_enabled        = true
  patterns_to_match             = ["/*"]
  supported_protocols           = ["Http", "Https"]
  link_to_default_domain        = true

  cdn_frontdoor_custom_domain_ids = [azurerm_cdn_frontdoor_custom_domain.custom_domain.id]
}

# Custom Domain
resource "azurerm_cdn_frontdoor_custom_domain" "custom_domain" {
  name                     = var.custom_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.fd_profile.id
  host_name                = var.custom_domain_name

  tls {
    certificate_type    = "ManagedCertificate"
    minimum_tls_version = "TLS12"
  }
}
