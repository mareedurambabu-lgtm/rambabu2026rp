output "resource_group_name" {
  value = azurerm_resource_group.this.name
}

output "vnet_id" {
  value = module.network.vnet_id
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "vm_id" {
  value = module.compute.vm_id
}

output "storage_account_id" {
  value = module.storage_account.id
}
