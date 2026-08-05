output "id" {
  description = "Resource ID of the AKS cluster."
  value       = azurerm_kubernetes_cluster.this.id
}

output "name" {
  description = "Name of the AKS cluster."
  value       = azurerm_kubernetes_cluster.this.name
}

output "fqdn" {
  description = "AKS cluster FQDN."
  value       = azurerm_kubernetes_cluster.this.fqdn
}

output "private_fqdn" {
  description = "Private AKS cluster FQDN."
  value       = azurerm_kubernetes_cluster.this.private_fqdn
}

output "kubelet_identity" {
  description = "AKS kubelet managed identity."
  value       = azurerm_kubernetes_cluster.this.kubelet_identity
}

output "oidc_issuer_url" {
  description = "OIDC issuer URL for workload identity."
  value       = azurerm_kubernetes_cluster.this.oidc_issuer_url
}

output "principal_id" {
  description = "Principal ID of the AKS system-assigned identity."
  value       = azurerm_kubernetes_cluster.this.identity[0].principal_id
}