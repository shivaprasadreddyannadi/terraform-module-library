# Storage Account Module

Creates a secure Azure Storage Account and optional private blob containers.

## Features

- StorageV2 support
- Configurable replication strategy
- TLS 1.2 minimum
- HTTPS-only access
- Public blob access disabled
- Shared key authentication disabled by default
- OAuth authentication enabled by default
- Infrastructure encryption
- Blob versioning
- Blob and container soft delete
- Optional private containers
- Standard tagging

## Inputs

| Name | Description | Type | Default |
|---|---|---|---|
| `name` | Storage Account name | `string` | Required |
| `resource_group_name` | Resource group name | `string` | Required |
| `location` | Azure region | `string` | Required |
| `account_tier` | Performance tier | `string` | `Standard` |
| `account_replication_type` | Replication strategy | `string` | `LRS` |
| `access_tier` | Blob access tier | `string` | `Hot` |
| `public_network_access_enabled` | Enable public access | `bool` | `false` |
| `shared_access_key_enabled` | Enable shared key authentication | `bool` | `false` |
| `containers` | Blob containers | `map(object)` | `{}` |
| `tags` | Resource tags | `map(string)` | `{}` |

## Outputs

| Name | Description |
|---|---|
| `id` | Storage Account resource ID |
| `name` | Storage Account name |
| `primary_blob_endpoint` | Blob endpoint |
| `primary_dfs_endpoint` | Data Lake endpoint |
| `container_ids` | Map of container IDs |

## Example

```hcl
module "storage_account" {
  source = "../../modules/storage-account"

  name                = "stplatformdev001"
  resource_group_name = "rg-platform-dev-centralus"
  location            = "centralus"

  account_replication_type = "LRS"

  containers = {
    application = {}
    diagnostics = {}
  }

  tags = {
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}
```