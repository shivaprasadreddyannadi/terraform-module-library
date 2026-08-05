module "aks" {
  source = "../../modules/aks"

  name                = "aks-platform-dev-centralus"
  location            = "centralus"
  resource_group_name = "rg-aks-platform-dev-centralus"
  dns_prefix          = "aks-platform-dev"

  subnet_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-network-dev-centralus/providers/Microsoft.Network/virtualNetworks/vnet-platform-dev-centralus/subnets/snet-aks"

  sku_tier = "Free"

  system_node_pool_name = "system"
  system_node_vm_size   = "Standard_D2s_v5"
  system_node_min_count = 2
  system_node_max_count = 3

  network_plugin = "azure"
  network_policy = "azure"

  azure_policy_enabled      = true
  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  tags = {
    Environment = "dev"
    Application = "aks-platform"
    ManagedBy   = "terraform"
  }
}