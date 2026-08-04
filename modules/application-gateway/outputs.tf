output "id" {
  description = "Resource ID of the Application Gateway."
  value       = azurerm_application_gateway.this.id
}

output "name" {
  description = "Name of the Application Gateway."
  value       = azurerm_application_gateway.this.name
}

output "backend_address_pool_ids" {
  description = "Backend address pool resource IDs."
  value       = azurerm_application_gateway.this.backend_address_pool[*].id
}

output "frontend_ip_configuration_ids" {
  description = "Frontend IP configuration resource IDs."
  value       = azurerm_application_gateway.this.frontend_ip_configuration[*].id
}