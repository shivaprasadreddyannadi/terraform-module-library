output "id" {
  description = "Resource ID of the Storage Account."
  value       = azurerm_storage_account.this.id
}

output "name" {
  description = "Name of the Storage Account."
  value       = azurerm_storage_account.this.name
}

output "primary_blob_endpoint" {
  description = "Primary blob service endpoint."
  value       = azurerm_storage_account.this.primary_blob_endpoint
}

output "primary_dfs_endpoint" {
  description = "Primary Data Lake Storage endpoint."
  value       = azurerm_storage_account.this.primary_dfs_endpoint
}

output "container_ids" {
  description = "Map of container names to resource IDs."

  value = {
    for name, container in azurerm_storage_container.this :
    name => container.id
  }
}