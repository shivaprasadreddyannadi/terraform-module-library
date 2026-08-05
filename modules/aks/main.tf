resource "azurerm_kubernetes_cluster" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version
  sku_tier            = var.sku_tier

  role_based_access_control_enabled = var.role_based_access_control_enabled
  azure_policy_enabled              = var.azure_policy_enabled
  oidc_issuer_enabled               = var.oidc_issuer_enabled
  workload_identity_enabled         = var.workload_identity_enabled
  private_cluster_enabled           = var.private_cluster_enabled

  default_node_pool {
    name                 = var.system_node_pool_name
    vm_size              = var.system_node_vm_size
    auto_scaling_enabled = true
    min_count            = var.system_node_min_count
    max_count            = var.system_node_max_count
    os_disk_size_gb      = var.system_node_os_disk_size_gb
    type                 = "VirtualMachineScaleSets"
    vnet_subnet_id       = var.subnet_id

    node_labels = {
      workload = "system"
    }
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = var.network_plugin
    network_policy    = var.network_policy
    load_balancer_sku = var.load_balancer_sku
    service_cidr      = var.service_cidr
    dns_service_ip    = var.dns_service_ip
    pod_cidr          = var.network_plugin == "kubenet" ? var.pod_cidr : null
  }

  dynamic "oms_agent" {
    for_each = var.log_analytics_workspace_id == null ? [] : [1]

    content {
      log_analytics_workspace_id = var.log_analytics_workspace_id
    }
  }

  tags = var.tags
}