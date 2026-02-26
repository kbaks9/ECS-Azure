variable "resource_group_name" {
  description = "Name of the resource group where resources will be deployed"
  type        = string
}

variable "location" {
  description = "Azure region for all resources"
  type        = string
}

variable "identity_name" {
  description = "Name of the user assigned identity"
  type        = string
}

variable "scope" {
  description = "The full resource ID of the Azure Container Registry"
  type        = string
}
