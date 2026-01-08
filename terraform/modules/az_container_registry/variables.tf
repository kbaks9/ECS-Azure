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

# ACR 
variable "name_acr" {
  type        = string
  description = "Name of the ACR"
  default     = "cntaskmanager"
}
