output "storage_account_id" {
  description = "Resource ID of the example Storage Account."
  value       = module.storage_account.id
}

output "storage_account_name" {
  description = "Name of the example Storage Account."
  value       = module.storage_account.name
}

output "container_ids" {
  description = "Container IDs created by the example."
  value       = module.storage_account.container_ids
}