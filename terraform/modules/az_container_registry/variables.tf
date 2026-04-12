# Azure container registry name
variable "cr_name" {
  type = string
}

variable "resource_group" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(string)
}
