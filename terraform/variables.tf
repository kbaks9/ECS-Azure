# ### General

# Resource Group
variable "resource_group" {
  type        = string
  description = "Name of the resource group"
}

# Location
variable "location" {
  type = string
}

###

# Container
variable "app_name" {
  description = "Name of the Azure Container App"
  type        = string
}

variable "env_name" {
  description = "Name of the Azure Container App Environment"
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

### Front Door ###
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
  description = "The name of the front door profile"
}

variable "sku_name" {
  type        = string
  description = "The name of SKU"
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
