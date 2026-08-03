variable "name" {
  description = "Name of the user-assigned managed identity."
  type        = string

  validation {
    condition     = length(trimspace(var.name)) > 0
    error_message = "The managed identity name cannot be empty."
  }
}

variable "location" {
  description = "Azure region where the managed identity will be created."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group containing the managed identity."
  type        = string
}

variable "tags" {
  description = "Tags applied to the managed identity."
  type        = map(string)
  default     = {}
}