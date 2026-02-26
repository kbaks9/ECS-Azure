# Resource Group
variable "resource_group" {
  type        = string
  description = "Name of the resource group"
}

# Location
variable "location" {
  type = string
}

variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "virtual_network_address_space" {
  description = "Address space for the virtual network"
  type        = string
}

variable "container_app_subnet_name" {
  description = "Name of the subnet for container apps"
  type        = string
}

variable "container_app_subnet_prefix" {
  description = "Address prefix for the subnet"
  type        = string
}
