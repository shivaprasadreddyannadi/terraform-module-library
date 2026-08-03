output "managed_identity_id" {
  description = "Resource ID of the example managed identity."
  value       = module.managed_identity.id
}

output "managed_identity_client_id" {
  description = "Client ID of the example managed identity."
  value       = module.managed_identity.client_id
}

output "managed_identity_principal_id" {
  description = "Principal ID of the example managed identity."
  value       = module.managed_identity.principal_id
}