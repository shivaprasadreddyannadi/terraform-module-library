output "id" {
  description = "Resource ID of the Virtual Network."
  value       = azurerm_virtual_network.this.id
}

output "name" {
  description = "Name of the Virtual Network."
  value       = azurerm_virtual_network.this.name
}

output "address_space" {
  description = "Address spaces assigned to the Virtual Network."
  value       = azurerm_virtual_network.this.address_space
}

output "subnet_ids" {
  description = "Map of subnet names to resource IDs."

  value = {
    for name, subnet in azurerm_subnet.this :
    name => subnet.id
  }
}