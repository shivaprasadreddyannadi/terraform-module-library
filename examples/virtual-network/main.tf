module "virtual_network" {
  source = "../../modules/virtual-network"

  name                = "vnet-platform-dev-centralus"
  location            = "centralus"
  resource_group_name = "rg-network-dev-centralus"
  address_space       = ["10.10.0.0/16"]

  subnets = {
    snet-application = {
      address_prefixes = ["10.10.1.0/24"]
    }

    snet-management = {
      address_prefixes = ["10.10.2.0/24"]
    }

    snet-private-endpoints = {
      address_prefixes                  = ["10.10.3.0/24"]
      private_endpoint_network_policies = "Disabled"
    }
  }

  tags = {
    Environment = "dev"
    Application = "platform"
    ManagedBy   = "terraform"
  }
}