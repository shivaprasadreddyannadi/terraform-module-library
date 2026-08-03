# Resource Group Module

## Purpose

Creates a reusable Azure Resource Group.

## Inputs

| Name | Type |
|------|------|
| resource_group_name | string |
| location | string |
| tags | map(string) |

## Outputs

| Name |
|------|
| resource_group_name |
| resource_group_id |
| location |

## Example

```hcl
module "resource_group" {

  source = "../../modules/resource-group"

  resource_group_name = "rg-platform-dev"

  location = "East US"

  tags = {

    Environment = "Dev"

    Owner = "Platform Team"

  }

}
```