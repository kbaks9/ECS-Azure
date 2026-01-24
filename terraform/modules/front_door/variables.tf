variable "resource_group" {
  type        = string
  description = "Resource group name"
}

variable "origin_host_name" {
  type        = string
  description = "Container App FQDN"
}

variable "custom_name" {
  type        = string
  description = "Name for the custom domain resource"
}

variable "custom_domain_name" {
  type        = string
  description = "Your actual domain"
}
