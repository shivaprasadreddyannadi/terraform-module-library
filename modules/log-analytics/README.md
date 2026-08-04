# Log Analytics Module

Creates an Azure Log Analytics Workspace for centralized monitoring and operational logging.

## Features

- Configurable pricing SKU
- Configurable retention period
- Optional daily ingestion quota
- Public ingestion and query controls
- Standard tagging
- Reusable workspace outputs

## Inputs

| Name | Description | Type | Default |
|---|---|---|---|
| `name` | Workspace name | `string` | Required |
| `location` | Azure region | `string` | Required |
| `resource_group_name` | Resource group name | `string` | Required |
| `sku` | Workspace SKU | `string` | `PerGB2018` |
| `retention_in_days` | Data-retention period | `number` | `30` |
| `daily_quota_gb` | Daily ingestion quota | `number` | `-1` |
| `internet_ingestion_enabled` | Enable public ingestion | `bool` | `true` |
| `internet_query_enabled` | Enable public queries | `bool` | `true` |
| `tags` | Resource tags | `map(string)` | `{}` |

## Outputs

| Name | Description |
|---|---|
| `id` | Workspace resource ID |
| `name` | Workspace name |
| `workspace_id` | Workspace customer ID |
| `resource_group_name` | Resource group name |

## Example

```hcl
module "log_analytics" {
  source = "../../modules/log-analytics"

  name                = "log-platform-dev-centralus"
  location            = "centralus"
  resource_group_name = "rg-platform-dev-centralus"

  retention_in_days = 30
  daily_quota_gb    = 5

  tags = {
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}