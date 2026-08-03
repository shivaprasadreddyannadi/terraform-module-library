# Key Vault Module

Creates a secure Azure Key Vault using Azure RBAC authorization.

## Features

- Azure RBAC authorization
- Standard or Premium SKU
- Soft-delete retention
- Purge protection enabled by default
- Public network access disabled by default
- Default-deny network rules
- Optional IP and subnet allowlists
- Standard tagging
- No secret values stored in module code

## Inputs

| Name | Description | Type | Default |
|---|---|---|---|
| `name` | Globally unique Key Vault name | `string` | Required |
| `location` | Azure region | `string` | Required |
| `resource_group_name` | Resource group name | `string` | Required |
| `tenant_id` | Microsoft Entra tenant ID | `string` | Required |
| `sku_name` | Key Vault SKU | `string` | `standard` |
| `soft_delete_retention_days` | Soft-delete retention | `number` | `7` |
| `purge_protection_enabled` | Enable purge protection | `bool` | `true` |
| `public_network_access_enabled` | Enable public network access | `bool` | `false` |
| `ip_rules` | Allowed IP rules | `list(string)` | `[]` |
| `virtual_network_subnet_ids` | Allowed subnet IDs | `list(string)` | `[]` |
| `tags` | Resource tags | `map(string)` | `{}` |

## Outputs

| Name | Description |
|---|---|
| `id` | Key Vault resource ID |
| `name` | Key Vault name |
| `vault_uri` | Key Vault URI |
| `resource_group_name` | Resource group name |

## Example

```hcl
module "key_vault" {
  source = "../../modules/key-vault"

  name                = "kv-platform-dev-001"
  location            = "centralus"
  resource_group_name = "rg-platform-dev-centralus"
  tenant_id           = "00000000-0000-0000-0000-000000000000"

  purge_protection_enabled      = false
  public_network_access_enabled = false

  tags = {
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}
```

The tenant ID above is a placeholder for validation and documentation only.