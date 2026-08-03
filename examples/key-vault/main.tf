module "key_vault" {
  source = "../../modules/key-vault"

  name                = "kv-platform-dev-001"
  location            = "centralus"
  resource_group_name = "rg-platform-dev-centralus"

  tenant_id = "00000000-0000-0000-0000-000000000000"

  sku_name                      = "standard"
  soft_delete_retention_days    = 7
  purge_protection_enabled      = false
  public_network_access_enabled = false
  network_default_action        = "Deny"

  tags = {
    Environment = "dev"
    Application = "platform"
    ManagedBy   = "terraform"
  }
}