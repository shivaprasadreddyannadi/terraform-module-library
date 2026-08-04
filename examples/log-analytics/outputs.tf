output "log_analytics_id" {
  description = "Resource ID of the example workspace."
  value       = module.log_analytics.id
}

output "log_analytics_name" {
  description = "Name of the example workspace."
  value       = module.log_analytics.name
}

output "log_analytics_workspace_id" {
  description = "Customer ID of the example workspace."
  value       = module.log_analytics.workspace_id
}