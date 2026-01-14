variable "app_name" { type = string }
variable "env_name" { type = string }
variable "resource_group" { type = string }
variable "location" { type = string }
variable "container_name" { type = string }
variable "image" { type = string }
variable "cpu" { type = number }
variable "memory" { type = string }
variable "acr_login_server" { type = string }
variable "acr_id" {
  description = "The full resource ID of the Azure Container Registry"
  type        = string
}
