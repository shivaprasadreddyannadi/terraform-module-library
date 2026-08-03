module "resource_group" {

  source = "../../modules/resource-group"

  resource_group_name = "rg-platform-dev"

  location = "East US"

  tags = {

    Environment = "Development"

    ManagedBy = "Terraform"

  }

}