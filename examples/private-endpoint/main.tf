module "private_endpoint" {
  source = "../../modules/private-endpoint"

  name                = "pep-storage-dev-centralus"
  location            = "centralus"
  resource_group_name = "rg-network-dev-centralus"

  subnet_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-network-dev-centralus/providers/Microsoft.Network/virtualNetworks/vnet-platform-dev-centralus/subnets/snet-private-endpoints"

  private_service_connection_name = "psc-storage-dev"

  private_connection_resource_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-platform-dev-centralus/providers/Microsoft.Storage/storageAccounts/stplatformdev001"

  subresource_names    = ["blob"]
  is_manual_connection = false

  private_dns_zone_ids = [
    "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-dns-dev-centralus/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"
  ]

  tags = {
    Environment = "dev"
    Application = "platform"
    ManagedBy   = "terraform"
  }
}