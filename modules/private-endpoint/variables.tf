variable "name" {
  description = "Name of the Azure Private Endpoint."
  type        = string

  validation {
    condition     = length(trimspace(var.name)) > 0
    error_message = "The Private Endpoint name cannot be empty."
  }
}

variable "location" {
  description = "Azure region where the Private Endpoint will be created."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group containing the Private Endpoint."
  type        = string
}

variable "subnet_id" {
  description = "Resource ID of the subnet hosting the Private Endpoint."
  type        = string
}

variable "private_service_connection_name" {
  description = "Name of the private service connection."
  type        = string
}

variable "private_connection_resource_id" {
  description = "Resource ID of the Azure service receiving the private connection."
  type        = string
}

variable "subresource_names" {
  description = "Service subresources, such as blob, vault, sqlServer, or registry."
  type        = list(string)

  validation {
    condition     = length(var.subresource_names) > 0
    error_message = "At least one subresource name must be provided."
  }
}

variable "is_manual_connection" {
  description = "Whether the private service connection requires manual approval."
  type        = bool
  default     = false
}

variable "request_message" {
  description = "Optional message sent when manual approval is required."
  type        = string
  default     = null
}

variable "private_dns_zone_ids" {
  description = "Optional Private DNS Zone resource IDs associated with the endpoint."
  type        = list(string)
  default     = []
}

variable "private_dns_zone_group_name" {
  description = "Name of the Private DNS Zone group."
  type        = string
  default     = "default"
}

variable "custom_network_interface_name" {
  description = "Optional custom name for the Private Endpoint network interface."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags applied to the Private Endpoint."
  type        = map(string)
  default     = {}
}