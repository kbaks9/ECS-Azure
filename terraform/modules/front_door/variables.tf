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

variable "profile_name" {
  type        = string
  description = "The name of th  front door profile"
}

variable "sku_name" {
  type        = string
  description = "The SKU name"
}

variable "ep_name" {
  type        = string
  description = "The name of the front door endpoint"
}

variable "fd_group_name" {
  type        = string
  description = "The name of the Origin Group"
}

variable "fd_origin_name" {
  type        = string
  description = "The name of the origin"
}

variable "fd_route_name" {
  type        = string
  description = "The front door routing name"
}
