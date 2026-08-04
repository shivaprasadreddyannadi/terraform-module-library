locals {
  gateway_ip_configuration_name = "${var.name}-gateway-ip"
  frontend_ip_name              = "${var.name}-frontend-ip"
  frontend_port_name            = "${var.name}-frontend-port"
  backend_pool_name             = "${var.name}-backend-pool"
  backend_http_settings_name    = "${var.name}-backend-settings"
  listener_name                 = "${var.name}-listener"
  probe_name                    = "${var.name}-probe"
  routing_rule_name             = "${var.name}-routing-rule"
}

resource "azurerm_application_gateway" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  enable_http2 = var.enable_http2

  sku {
    name = var.sku_name
    tier = var.sku_tier
  }

  autoscale_configuration {
    min_capacity = var.minimum_capacity
    max_capacity = var.maximum_capacity
  }

  gateway_ip_configuration {
    name      = local.gateway_ip_configuration_name
    subnet_id = var.subnet_id
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_name
    public_ip_address_id = var.public_ip_address_id
  }

  frontend_port {
    name = local.frontend_port_name
    port = var.frontend_port
  }

  backend_address_pool {
    name         = local.backend_pool_name
    fqdns        = var.backend_fqdns
    ip_addresses = var.backend_ip_addresses
  }

  probe {
    name                = local.probe_name
    protocol            = var.backend_protocol
    host                = var.probe_host
    path                = var.probe_path
    interval            = var.probe_interval_seconds
    timeout             = var.probe_timeout_seconds
    unhealthy_threshold = var.probe_unhealthy_threshold
  }

  backend_http_settings {
    name                  = local.backend_http_settings_name
    cookie_based_affinity = "Disabled"
    path                  = null
    port                  = var.backend_port
    protocol              = var.backend_protocol
    request_timeout       = var.request_timeout_seconds
    probe_name            = local.probe_name
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_pool_name
    backend_http_settings_name = local.backend_http_settings_name
    priority                   = 100
  }

  tags = var.tags
}