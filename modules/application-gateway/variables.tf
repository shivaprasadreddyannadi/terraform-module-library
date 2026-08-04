variable "name" {
  description = "Name of the Azure Application Gateway."
  type        = string

  validation {
    condition     = length(trimspace(var.name)) > 0
    error_message = "The Application Gateway name cannot be empty."
  }
}

variable "location" {
  description = "Azure region where the Application Gateway will be created."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group containing the Application Gateway."
  type        = string
}

variable "subnet_id" {
  description = "Resource ID of the dedicated Application Gateway subnet."
  type        = string
}

variable "public_ip_address_id" {
  description = "Resource ID of the public IP used by the frontend."
  type        = string
}

variable "sku_name" {
  description = "Application Gateway SKU name."
  type        = string
  default     = "Standard_v2"

  validation {
    condition     = contains(["Standard_v2", "WAF_v2"], var.sku_name)
    error_message = "The SKU name must be Standard_v2 or WAF_v2."
  }
}

variable "sku_tier" {
  description = "Application Gateway SKU tier."
  type        = string
  default     = "Standard_v2"

  validation {
    condition     = contains(["Standard_v2", "WAF_v2"], var.sku_tier)
    error_message = "The SKU tier must be Standard_v2 or WAF_v2."
  }
}

variable "minimum_capacity" {
  description = "Minimum autoscale instance count."
  type        = number
  default     = 1

  validation {
    condition     = var.minimum_capacity >= 0
    error_message = "Minimum capacity must be zero or greater."
  }
}

variable "maximum_capacity" {
  description = "Maximum autoscale instance count."
  type        = number
  default     = 3

  validation {
    condition     = var.maximum_capacity >= var.minimum_capacity
    error_message = "Maximum capacity must be greater than or equal to minimum capacity."
  }
}

variable "frontend_port" {
  description = "Frontend listener port."
  type        = number
  default     = 80
}

variable "backend_port" {
  description = "Backend application port."
  type        = number
  default     = 80
}

variable "backend_protocol" {
  description = "Protocol used to connect to backend targets."
  type        = string
  default     = "Http"

  validation {
    condition     = contains(["Http", "Https"], var.backend_protocol)
    error_message = "Backend protocol must be Http or Https."
  }
}

variable "backend_fqdns" {
  description = "Optional backend fully qualified domain names."
  type        = list(string)
  default     = []
}

variable "backend_ip_addresses" {
  description = "Optional backend IP addresses."
  type        = list(string)
  default     = []
}

variable "request_timeout_seconds" {
  description = "Backend request timeout in seconds."
  type        = number
  default     = 30
}

variable "probe_path" {
  description = "HTTP path used by the health probe."
  type        = string
  default     = "/"
}

variable "probe_host" {
  description = "Host header used by the health probe."
  type        = string
  default     = "127.0.0.1"
}

variable "probe_interval_seconds" {
  description = "Interval between health probes."
  type        = number
  default     = 30
}

variable "probe_timeout_seconds" {
  description = "Health-probe timeout."
  type        = number
  default     = 30
}

variable "probe_unhealthy_threshold" {
  description = "Failed probes before a backend is marked unhealthy."
  type        = number
  default     = 3
}

variable "enable_http2" {
  description = "Enable HTTP/2 on the Application Gateway."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags applied to the Application Gateway."
  type        = map(string)
  default     = {}
}