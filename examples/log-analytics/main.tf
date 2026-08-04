module "log_analytics" {
  source = "../../modules/log-analytics"

  name                = "log-platform-dev-centralus"
  location            = "centralus"
  resource_group_name = "rg-platform-dev-centralus"

  sku               = "PerGB2018"
  retention_in_days = 30
  daily_quota_gb    = 5

  internet_ingestion_enabled = true
  internet_query_enabled     = true

  tags = {
    Environment = "dev"
    Application = "platform"
    ManagedBy   = "terraform"
  }
}