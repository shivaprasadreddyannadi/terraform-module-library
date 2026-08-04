output "application_gateway_id" {
  description = "Resource ID of the example Application Gateway."
  value       = module.application_gateway.id
}

output "application_gateway_name" {
  description = "Name of the example Application Gateway."
  value       = module.application_gateway.name
}