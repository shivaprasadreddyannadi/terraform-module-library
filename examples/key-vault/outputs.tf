output "key_vault_id" {
  description = "Resource ID of the example Key Vault."
  value       = module.key_vault.id
}

output "key_vault_name" {
  description = "Name of the example Key Vault."
  value       = module.key_vault.name
}

output "key_vault_uri" {
  description = "URI of the example Key Vault."
  value       = module.key_vault.vault_uri
}