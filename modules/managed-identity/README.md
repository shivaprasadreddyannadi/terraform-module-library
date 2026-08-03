# Managed Identity Module

Creates an Azure user-assigned managed identity.

## Features

- Reusable user-assigned identity
- No stored credentials
- Supports Azure RBAC assignments
- Suitable for AKS workload identity, applications and automation
- Standard tagging

## Inputs

| Name | Description | Type | Default |
|---|---|---|---|
| `name` | Managed identity name | `string` | Required |
| `location` | Azure region | `string` | Required |
| `resource_group_name` | Resource group name | `string` | Required |
| `tags` | Resource tags | `map(string)` | `{}` |

## Outputs

| Name | Description |
|---|---|
| `id` | Resource ID |
| `name` | Identity name |
| `client_id` | Client ID |
| `principal_id` | Principal ID |
| `tenant_id` | Tenant ID |

## Example

```hcl
module "managed_identity" {
  source = "../../modules/managed-identity"

  name                = "id-platform-dev-centralus"
  location            = "centralus"
  resource_group_name = "rg-platform-dev-centralus"

  tags = {
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}