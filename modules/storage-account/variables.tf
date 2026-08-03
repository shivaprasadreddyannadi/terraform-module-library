variable "name" {
  description = "Globally unique name of the Azure Storage Account."
  type        = string

  validation {
    condition = (
      length(var.name) >= 3 &&
      length(var.name) <= 24 &&
      can(regex("^[a-z0-9]+$", var.name))
    )

    error_message = "The storage account name must contain 3 to 24 lowercase letters or numbers only."
  }
}

variable "resource_group_name" {
  description = "Name of the resource group containing the Storage Account."
  type        = string
}

variable "location" {
  description = "Azure region where the Storage Account will be created."
  type        = string
}

variable "account_tier" {
  description = "Storage Account performance tier."
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Standard", "Premium"], var.account_tier)
    error_message = "The account tier must be Standard or Premium."
  }
}

variable "account_replication_type" {
  description = "Storage Account replication strategy."
  type        = string
  default     = "LRS"

  validation {
    condition = contains(
      ["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"],
      var.account_replication_type
    )

    error_message = "Use a supported replication type such as LRS, GRS, RAGRS, ZRS, GZRS, or RAGZRS."
  }
}

variable "account_kind" {
  description = "Storage Account kind."
  type        = string
  default     = "StorageV2"
}

variable "access_tier" {
  description = "Default access tier for blob storage."
  type        = string
  default     = "Hot"

  validation {
    condition     = contains(["Hot", "Cool"], var.access_tier)
    error_message = "The access tier must be Hot or Cool."
  }
}

variable "minimum_tls_version" {
  description = "Minimum TLS version accepted by the Storage Account."
  type        = string
  default     = "TLS1_2"
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled."
  type        = bool
  default     = false
}

variable "allow_nested_items_to_be_public" {
  description = "Whether nested items such as containers and blobs can be public."
  type        = bool
  default     = false
}

variable "shared_access_key_enabled" {
  description = "Whether shared access key authentication is enabled."
  type        = bool
  default     = false
}

variable "infrastructure_encryption_enabled" {
  description = "Whether infrastructure encryption is enabled."
  type        = bool
  default     = true
}

variable "blob_soft_delete_retention_days" {
  description = "Blob soft-delete retention period."
  type        = number
  default     = 7

  validation {
    condition = (
      var.blob_soft_delete_retention_days >= 1 &&
      var.blob_soft_delete_retention_days <= 365
    )

    error_message = "Blob soft-delete retention must be between 1 and 365 days."
  }
}

variable "container_soft_delete_retention_days" {
  description = "Container soft-delete retention period."
  type        = number
  default     = 7

  validation {
    condition = (
      var.container_soft_delete_retention_days >= 1 &&
      var.container_soft_delete_retention_days <= 365
    )

    error_message = "Container soft-delete retention must be between 1 and 365 days."
  }
}

variable "containers" {
  description = "Map of private blob containers to create."

  type = map(object({
    access_type = optional(string, "private")
  }))

  default = {}
}

variable "tags" {
  description = "Tags applied to the Storage Account."
  type        = map(string)
  default     = {}
}