resource "azurerm_storage_account" "stact" {
  name                     = "firstsa233"
  resource_group_name      = azurerm_resource_group.practice.name
  location                 = azurerm_resource_group.practice.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}