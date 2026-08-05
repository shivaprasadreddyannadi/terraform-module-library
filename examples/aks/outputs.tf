output "aks_cluster_id" {
  description = "Resource ID of the example AKS cluster."
  value       = module.aks.id
}

output "aks_cluster_name" {
  description = "Name of the example AKS cluster."
  value       = module.aks.name
}

output "aks_oidc_issuer_url" {
  description = "OIDC issuer URL for workload identity."
  value       = module.aks.oidc_issuer_url
}