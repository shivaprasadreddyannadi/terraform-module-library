# Virtual Network Module

Creates an Azure Virtual Network and optional subnets.

## Features

- Configurable address spaces
- Optional custom DNS servers
- Multiple subnets using `for_each`
- Private Endpoint network-policy configuration
- Standard resource tagging
- Reusable subnet ID outputs

## Inputs

| Name | Description | Type | Default |
|---|---|---|---|
| `name` | Virtual Network name | `string` | Required |
| `location` | Azure region | `string` | Required |
| `resource_group_name` | Resource group name | `string` | Required |
| `address_space` | Virtual Network address spaces | `list(string)` | Required |
| `dns_servers` | Custom DNS server addresses | `list(string)` | `[]` |
| `subnets` | Subnet configuration map | `map(object)` | `{}` |
| `tags` | Resource tags | `map(string)` | `{}` |

## Outputs

| Name | Description |
|---|---|
| `id` | Virtual Network resource ID |
| `name` | Virtual Network name |
| `address_space` | Configured address spaces |
| `subnet_ids` | Map of subnet names to IDs |

## Example

```hcl
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

    snet-private-endpoints = {
      address_prefixes                  = ["10.10.2.0/24"]
      private_endpoint_network_policies = "Disabled"
    }
  }

  tags = {
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}
```