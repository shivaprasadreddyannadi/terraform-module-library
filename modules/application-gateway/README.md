# Application Gateway Module

Creates an Azure Application Gateway with a public frontend, backend pool, health probe, HTTP listener, and basic routing rule.

## Features

- Standard_v2 and WAF_v2 support
- Autoscaling
- Dedicated subnet integration
- Public frontend IP
- Backend FQDN or IP targets
- Configurable backend port and protocol
- Health probe
- Basic request-routing rule
- HTTP/2 support
- Standard tagging

## Inputs

| Name | Description | Type | Default |
|---|---|---|---|
| `name` | Application Gateway name | `string` | Required |
| `location` | Azure region | `string` | Required |
| `resource_group_name` | Resource group name | `string` | Required |
| `subnet_id` | Dedicated gateway subnet ID | `string` | Required |
| `public_ip_address_id` | Public IP resource ID | `string` | Required |
| `sku_name` | Gateway SKU name | `string` | `Standard_v2` |
| `sku_tier` | Gateway SKU tier | `string` | `Standard_v2` |
| `minimum_capacity` | Minimum autoscale capacity | `number` | `1` |
| `maximum_capacity` | Maximum autoscale capacity | `number` | `3` |
| `frontend_port` | Listener port | `number` | `80` |
| `backend_port` | Backend port | `number` | `80` |
| `backend_protocol` | Backend protocol | `string` | `Http` |
| `backend_fqdns` | Backend FQDNs | `list(string)` | `[]` |
| `backend_ip_addresses` | Backend IP addresses | `list(string)` | `[]` |
| `probe_path` | Health-probe path | `string` | `/` |
| `tags` | Resource tags | `map(string)` | `{}` |

## Outputs

| Name | Description |
|---|---|
| `id` | Application Gateway resource ID |
| `name` | Application Gateway name |
| `backend_address_pool_ids` | Backend pool IDs |
| `frontend_ip_configuration_ids` | Frontend configuration IDs |

## Example

```hcl
module "application_gateway" {
  source = "../../modules/application-gateway"

  name                = "agw-platform-dev-centralus"
  location            = "centralus"
  resource_group_name = "rg-network-dev-centralus"

  subnet_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-network-dev-centralus/providers/Microsoft.Network/virtualNetworks/vnet-platform-dev-centralus/subnets/snet-application-gateway"

  public_ip_address_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-network-dev-centralus/providers/Microsoft.Network/publicIPAddresses/pip-agw-platform-dev-centralus"

  backend_fqdns = [
    "platform-app.internal.example.com"
  ]

  tags = {
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}
```

The resource IDs above are placeholders.