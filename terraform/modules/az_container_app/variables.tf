variable "app_name" {
  description = "Name of the Azure Container App"
  type        = string
}

variable "env_name" {
  description = "Name of the Azure Container App Environment"
  type        = string
}

variable "resource_group" {
  description = "Name of the resource group where resources will be deployed"
  type        = string
}

variable "location" {
  description = "Azure region for all resources"
  type        = string
}

variable "container_name" {
  description = "Name of the container inside the Container App"
  type        = string
}

variable "image_tag" {
  description = "Name of the image tag"
  type        = string
}

variable "acr_login_server" {
  description = "ACR login server URL"
  type        = string
}

variable "acr_id" {
  description = "The full resource ID of the Azure Container Registry"
  type        = string
}
