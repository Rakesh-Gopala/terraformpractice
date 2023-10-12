resource "azurerm_network_interface" "netinterface" {
  name                = "myintrface"
  resource_group_name = azurerm_resource_group.practice.name
  location            = azurerm_resource_group.practice.location

  ip_configuration {
    name                          = "myipconfig"
    subnet_id                     = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"

  }

}


resource "azurerm_windows_virtual_machine" "virtmachine" {
  name                  = "myvirtualmach"
  resource_group_name   = azurerm_resource_group.practice.name
  location              = azurerm_resource_group.practice.location
  size                  = "Standard_B2ms"
  admin_username        = "rakesh"
  admin_password        = "Rakesh@123"
  network_interface_ids = [azurerm_network_interface.netinterface.id]

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"

  }
}