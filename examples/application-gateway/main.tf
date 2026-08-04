module "application_gateway" {
  source = "../../modules/application-gateway"

  name                = "agw-platform-dev-centralus"
  location            = "centralus"
  resource_group_name = "rg-network-dev-centralus"

  subnet_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-network-dev-centralus/providers/Microsoft.Network/virtualNetworks/vnet-platform-dev-centralus/subnets/snet-application-gateway"

  public_ip_address_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-network-dev-centralus/providers/Microsoft.Network/publicIPAddresses/pip-agw-platform-dev-centralus"

  sku_name = "Standard_v2"
  sku_tier = "Standard_v2"

  minimum_capacity = 1
  maximum_capacity = 3

  frontend_port    = 80
  backend_port     = 80
  backend_protocol = "Http"

  backend_fqdns = [
    "platform-app.internal.example.com"
  ]

  probe_path = "/health"

  tags = {
    Environment = "dev"
    Application = "platform"
    ManagedBy   = "terraform"
  }
}