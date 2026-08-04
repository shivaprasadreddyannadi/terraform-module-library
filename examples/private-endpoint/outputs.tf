output "private_endpoint_id" {
  description = "Resource ID of the example Private Endpoint."
  value       = module.private_endpoint.id
}

output "private_endpoint_name" {
  description = "Name of the example Private Endpoint."
  value       = module.private_endpoint.name
}

output "private_ip_address" {
  description = "Private IP assigned to the example endpoint."
  value       = module.private_endpoint.private_ip_address
}