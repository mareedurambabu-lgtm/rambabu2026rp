terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    environment = "prod"
    managed_by  = "terraform"
    owner       = "rambabu"
  }
}

module "network" {
  source = "../../modules/network"

  resource_group_name     = azurerm_resource_group.this.name
  location                = var.location
  vnet_name               = "vnet-prod"
  address_space           = ["10.30.0.0/16"]
  subnet_name             = "snet-prod"
  subnet_address_prefixes = ["10.30.1.0/24"]
}

module "compute" {
  source = "../../modules/compute"

  resource_group_name = azurerm_resource_group.this.name
  location            = var.location
  vm_name             = "vm-prod"
  vm_size             = "Standard_B2s"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  subnet_id           = module.network.subnet_id
}

module "storage_account" {
  source = "../../modules/storage_account"

  name                = "stprodterraform2026"
  resource_group_name = azurerm_resource_group.this.name
  location            = var.location
}
