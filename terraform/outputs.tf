output "acr_login_server" {
  value = module.az_container_registry.acr_login_server
}

output "fqdn" {
  value = module.az_container_app.fqdn
}
