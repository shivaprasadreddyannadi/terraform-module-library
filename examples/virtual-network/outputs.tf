output "virtual_network_id" {
  description = "Resource ID of the example Virtual Network."
  value       = module.virtual_network.id
}

output "subnet_ids" {
  description = "Subnet IDs created by the example."
  value       = module.virtual_network.subnet_ids
}