module "storage_account" {
  source = "../../modules/storage-account"

  name                = "stplatformdev001"
  resource_group_name = "rg-platform-dev-centralus"
  location            = "centralus"

  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier              = "Hot"

  public_network_access_enabled = false
  shared_access_key_enabled     = false

  containers = {
    application = {
      access_type = "private"
    }

    diagnostics = {
      access_type = "private"
    }
  }

  tags = {
    Environment = "dev"
    Application = "platform"
    ManagedBy   = "terraform"
  }
}