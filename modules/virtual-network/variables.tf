variable "name" {
  description = "Name of the Azure Virtual Network."
  type        = string

  validation {
    condition     = length(trimspace(var.name)) > 0
    error_message = "The virtual network name cannot be empty."
  }
}

variable "location" {
  description = "Azure region where the Virtual Network will be created."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group containing the Virtual Network."
  type        = string
}

variable "address_space" {
  description = "Address spaces assigned to the Virtual Network."
  type        = list(string)

  validation {
    condition     = length(var.address_space) > 0
    error_message = "At least one virtual network address space is required."
  }
}

variable "dns_servers" {
  description = "Optional custom DNS server IP addresses."
  type        = list(string)
  default     = []
}

variable "subnets" {
  description = "Map of subnets created inside the Virtual Network."

  type = map(object({
    address_prefixes                              = list(string)
    private_endpoint_network_policies             = optional(string, "Enabled")
    private_link_service_network_policies_enabled = optional(bool, true)
  }))

  default = {}
}

variable "tags" {
  description = "Tags applied to the Virtual Network."
  type        = map(string)
  default     = {}
}