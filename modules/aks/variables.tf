variable "name" {
  description = "Name of the AKS cluster."
  type        = string
}

variable "location" {
  description = "Azure region for the AKS cluster."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group containing the AKS cluster."
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster."
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID used by the AKS system node pool."
  type        = string
}

variable "kubernetes_version" {
  description = "Optional Kubernetes version."
  type        = string
  default     = null
}

variable "sku_tier" {
  description = "AKS SKU tier."
  type        = string
  default     = "Free"

  validation {
    condition     = contains(["Free", "Standard", "Premium"], var.sku_tier)
    error_message = "SKU tier must be Free, Standard, or Premium."
  }
}

variable "system_node_pool_name" {
  description = "Name of the system node pool."
  type        = string
  default     = "system"
}

variable "system_node_vm_size" {
  description = "VM size for the system node pool."
  type        = string
  default     = "Standard_D2s_v5"
}

variable "system_node_min_count" {
  description = "Minimum system node count."
  type        = number
  default     = 2
}

variable "system_node_max_count" {
  description = "Maximum system node count."
  type        = number
  default     = 3

  validation {
    condition     = var.system_node_max_count >= var.system_node_min_count
    error_message = "Maximum node count must be greater than or equal to minimum node count."
  }
}

variable "system_node_os_disk_size_gb" {
  description = "OS disk size for system nodes."
  type        = number
  default     = 64
}

variable "service_cidr" {
  description = "CIDR used by Kubernetes services."
  type        = string
  default     = "10.240.0.0/16"
}

variable "dns_service_ip" {
  description = "Kubernetes DNS service IP."
  type        = string
  default     = "10.240.0.10"
}

variable "pod_cidr" {
  description = "Optional pod CIDR when using kubenet."
  type        = string
  default     = null
}

variable "network_plugin" {
  description = "AKS network plugin."
  type        = string
  default     = "azure"

  validation {
    condition     = contains(["azure", "kubenet"], var.network_plugin)
    error_message = "Network plugin must be azure or kubenet."
  }
}

variable "network_policy" {
  description = "AKS network policy."
  type        = string
  default     = "azure"

  validation {
    condition     = contains(["azure", "calico", "cilium"], var.network_policy)
    error_message = "Network policy must be azure, calico, or cilium."
  }
}

variable "load_balancer_sku" {
  description = "Load Balancer SKU."
  type        = string
  default     = "standard"
}

variable "azure_policy_enabled" {
  description = "Enable the Azure Policy add-on."
  type        = bool
  default     = true
}

variable "oidc_issuer_enabled" {
  description = "Enable the AKS OIDC issuer."
  type        = bool
  default     = true
}

variable "workload_identity_enabled" {
  description = "Enable Azure Workload Identity."
  type        = bool
  default     = true
}

variable "role_based_access_control_enabled" {
  description = "Enable Kubernetes RBAC."
  type        = bool
  default     = true
}

variable "private_cluster_enabled" {
  description = "Create a private AKS cluster."
  type        = bool
  default     = false
}

variable "log_analytics_workspace_id" {
  description = "Optional Log Analytics Workspace ID for monitoring."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags applied to the AKS cluster."
  type        = map(string)
  default     = {}
}