variable "name" {
  description = "Globally unique Azure Key Vault name."
  type        = string

  validation {
    condition = (
      length(var.name) >= 3 &&
      length(var.name) <= 24 &&
      can(regex("^[a-zA-Z][a-zA-Z0-9-]*[a-zA-Z0-9]$", var.name))
    )

    error_message = "The Key Vault name must be 3-24 characters, start with a letter, and contain only letters, numbers, or hyphens."
  }
}

variable "location" {
  description = "Azure region where the Key Vault will be created."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group containing the Key Vault."
  type        = string
}

variable "tenant_id" {
  description = "Microsoft Entra tenant ID used by the Key Vault."
  type        = string
}

variable "sku_name" {
  description = "Key Vault SKU."
  type        = string
  default     = "standard"

  validation {
    condition     = contains(["standard", "premium"], var.sku_name)
    error_message = "The SKU must be standard or premium."
  }
}

variable "soft_delete_retention_days" {
  description = "Number of days deleted Key Vault objects remain recoverable."
  type        = number
  default     = 7

  validation {
    condition = (
      var.soft_delete_retention_days >= 7 &&
      var.soft_delete_retention_days <= 90
    )

    error_message = "Soft-delete retention must be between 7 and 90 days."
  }
}

variable "purge_protection_enabled" {
  description = "Enable protection against permanent deletion during the retention period."
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled."
  type        = bool
  default     = false
}

variable "network_default_action" {
  description = "Default action for Key Vault network rules."
  type        = string
  default     = "Deny"

  validation {
    condition     = contains(["Allow", "Deny"], var.network_default_action)
    error_message = "The network default action must be Allow or Deny."
  }
}

variable "network_bypass" {
  description = "Traffic allowed to bypass Key Vault network rules."
  type        = string
  default     = "AzureServices"

  validation {
    condition     = contains(["AzureServices", "None"], var.network_bypass)
    error_message = "Network bypass must be AzureServices or None."
  }
}

variable "ip_rules" {
  description = "Optional public IP addresses or CIDR ranges allowed to access the Key Vault."
  type        = list(string)
  default     = []
}

variable "virtual_network_subnet_ids" {
  description = "Optional subnet IDs allowed to access the Key Vault."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags applied to the Key Vault."
  type        = map(string)
  default     = {}
}