#### General Settings

# Resource Group
variable "resource_group" {
  type        = string
  description = "Name of the resource group"
  default     = "rg-taskmanager"
}

# Location
variable "location" {
  type        = string
  description = "value"
  default     = "uksouth"
}

###Container Application

# Azure Container Application
variable "app_name" {
  type        = string
  description = "Azure Container Application"
  default     = "taskmanager"
}

# Azure Container Environment
variable "cn_env" {
  type        = string
  description = "Azure Container Environment"
  default     = "tm-env"
}

# Container name within the Application
variable "cn_name" {
  type        = string
  description = "value"
  default     = "tm-app"
}
