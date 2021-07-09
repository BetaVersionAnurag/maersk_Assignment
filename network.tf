#Network
resource "azurerm_virtual_network" "maersk" {
  name                = "maersk-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.maersk.location
  resource_group_name = azurerm_resource_group.maersk.name
}

resource "azurerm_subnet" "maersk-1" {
  name                 = "maersk-subnet-1"
  resource_group_name  = azurerm_resource_group.maersk.name
  virtual_network_name = azurerm_virtual_network.maersk.name
  address_prefixes     = ["10.0.1.0/24"]

  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }
}

resource "azurerm_subnet" "maersk-2" {
  name                 = "maersk-subnet-1"
  resource_group_name  = azurerm_resource_group.maersk.name
  virtual_network_name = azurerm_virtual_network.maersk.name
  address_prefixes     = ["10.0.2.0/24"]

  delegation {
    name = "delegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }
}
