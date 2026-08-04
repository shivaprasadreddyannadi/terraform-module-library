# Private Endpoint Module

Creates an Azure Private Endpoint for private access to supported Azure services.

## Features

- Private connectivity through a VNet subnet
- Automatic or manual service-connection approval
- Support for service subresources
- Optional Private DNS Zone integration
- Optional custom network-interface name
- Standard tagging
- Reusable private IP and network-interface outputs

## Common Subresource Names

| Azure service | Example subresource |
|---|---|
| Storage Account Blob | `blob` |
| Storage Account Data Lake | `dfs` |
| Azure Key Vault | `vault` |
| Azure SQL Server | `sqlServer` |
| Azure Container Registry | `registry` |

## Inputs

| Name | Description | Type | Default |
|---|---|---|---|
| `name` | Private Endpoint name | `string` | Required |
| `location` | Azure region | `string` | Required |
| `resource_group_name` | Resource group name | `string` | Required |
| `subnet_id` | Private Endpoint subnet ID | `string` | Required |
| `private_service_connection_name` | Connection name | `string` | Required |
| `private_connection_resource_id` | Target service resource ID | `string` | Required |
| `subresource_names` | Target subresources | `list(string)` | Required |
| `is_manual_connection` | Require manual approval | `bool` | `false` |
| `private_dns_zone_ids` | Private DNS Zone IDs | `list(string)` | `[]` |
| `tags` | Resource tags | `map(string)` | `{}` |

## Outputs

| Name | Description |
|---|---|
| `id` | Private Endpoint resource ID |
| `name` | Private Endpoint name |
| `network_interface_id` | Network-interface resource ID |
| `private_ip_address` | Assigned private IP |
| `private_service_connection_name` | Service-connection name |

## Example

```hcl
module "private_endpoint" {
  source = "../../modules/private-endpoint"

  name                = "pep-storage-dev-centralus"
  location            = "centralus"
  resource_group_name = "rg-network-dev-centralus"
  subnet_id           = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-network-dev-centralus/providers/Microsoft.Network/virtualNetworks/vnet-platform-dev-centralus/subnets/snet-private-endpoints"

  private_service_connection_name = "psc-storage-dev"

  private_connection_resource_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-platform-dev-centralus/providers/Microsoft.Storage/storageAccounts/stplatformdev001"

  subresource_names = ["blob"]

  tags = {
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}