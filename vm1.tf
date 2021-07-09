resource "azurerm_network_interface" "example-1" {
  name                = "example-1-nic"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example-1.id
    private_ip_address_allocation = "Dynamic"
  }
}

#Get the admin password from key-vault
data "azurerm_key_vault" "example" {
  name                = "mykeyvault"
  resource_group_name = "some-resource-group"
}

data "azurerm_key_vault_secret" "admin-password" {
  name         = "secret-sauce"
  key_vault_id = data.azurerm_key_vault.example.id
}

resource "azurerm_windows_virtual_machine" "example-1" {
  name                = "example-1-machine"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = data.azurerm_key_vault_secret.admin-password.value
  network_interface_ids = [
    azurerm_network_interface.example-1.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}