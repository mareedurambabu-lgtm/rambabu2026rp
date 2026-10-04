variable "location" {
  type    = string
  default = "eastus"
}

variable "resource_group_name" {
  type = string
}

variable "admin_username" {
  type    = string
  default = "azureadmin"
}

variable "admin_password" {
  type      = string
  sensitive = true
}
