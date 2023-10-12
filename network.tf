resource "azurerm_virtual_network" "newnetwork" {
  name                = "mynetwork"
  location            = azurerm_resource_group.practice.location
  resource_group_name = azurerm_resource_group.practice.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "mysubnet" {
  name                 = "mysubnet1"
  resource_group_name  = azurerm_resource_group.practice.name
  virtual_network_name = azurerm_virtual_network.newnetwork.name
  address_prefixes     = ["10.0.1.0/24"]
}