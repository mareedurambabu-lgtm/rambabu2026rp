terraform {
  backend "azurerm" {
    resource_group_name  = "terraform"
    storage_account_name = "terraformsa2026"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
