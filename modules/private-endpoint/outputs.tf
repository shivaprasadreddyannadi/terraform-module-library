output "id" {
  description = "Resource ID of the Private Endpoint."
  value       = azurerm_private_endpoint.this.id
}

output "name" {
  description = "Name of the Private Endpoint."
  value       = azurerm_private_endpoint.this.name
}

output "network_interface_id" {
  description = "Resource ID of the Private Endpoint network interface."
  value       = azurerm_private_endpoint.this.network_interface[0].id
}

output "private_ip_address" {
  description = "Private IP address assigned to the endpoint."
  value       = azurerm_private_endpoint.this.private_service_connection[0].private_ip_address
}

output "private_service_connection_name" {
  description = "Name of the private service connection."
  value       = azurerm_private_endpoint.this.private_service_connection[0].name
}