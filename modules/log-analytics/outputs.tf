output "id" {
  description = "Resource ID of the Log Analytics Workspace."
  value       = azurerm_log_analytics_workspace.this.id
}

output "name" {
  description = "Name of the Log Analytics Workspace."
  value       = azurerm_log_analytics_workspace.this.name
}

output "workspace_id" {
  description = "Customer ID of the Log Analytics Workspace."
  value       = azurerm_log_analytics_workspace.this.workspace_id
}

output "resource_group_name" {
  description = "Resource group containing the workspace."
  value       = azurerm_log_analytics_workspace.this.resource_group_name
}