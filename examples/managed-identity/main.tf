module "managed_identity" {
  source = "../../modules/managed-identity"

  name                = "id-platform-dev-centralus"
  location            = "centralus"
  resource_group_name = "rg-platform-dev-centralus"

  tags = {
    Environment = "dev"
    Application = "platform"
    ManagedBy   = "terraform"
  }
}