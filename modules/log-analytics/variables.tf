variable "name" {
  description = "Name of the Azure Log Analytics Workspace."
  type        = string

  validation {
    condition = (
      length(var.name) >= 4 &&
      length(var.name) <= 63
    )

    error_message = "The Log Analytics Workspace name must contain 4 to 63 characters."
  }
}

variable "location" {
  description = "Azure region where the workspace will be created."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group containing the workspace."
  type        = string
}

variable "sku" {
  description = "Log Analytics Workspace pricing SKU."
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "Number of days workspace data is retained."
  type        = number
  default     = 30

  validation {
    condition = (
      var.retention_in_days >= 30 &&
      var.retention_in_days <= 730
    )

    error_message = "Retention must be between 30 and 730 days."
  }
}

variable "daily_quota_gb" {
  description = "Daily ingestion quota in GB. Use -1 for unlimited."
  type        = number
  default     = -1

  validation {
    condition = (
      var.daily_quota_gb == -1 ||
      var.daily_quota_gb > 0
    )

    error_message = "Daily quota must be -1 or greater than zero."
  }
}

variable "internet_ingestion_enabled" {
  description = "Allow log ingestion over the public internet."
  type        = bool
  default     = true
}

variable "internet_query_enabled" {
  description = "Allow workspace queries over the public internet."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags applied to the workspace."
  type        = map(string)
  default     = {}
}