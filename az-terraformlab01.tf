resource "azurerm_resource_group" "rg" {
  name     = "rg-terraformlab"
  location = "EastUs2"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-terraformlab"
  address_space       = ["172.10.0.0/16"]
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
}

resource "azurerm_subnet" "snet" {
  name                 = "snet-terraformalab"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  address_prefix       = "172.10.1.0/24"

  delegation {
    name = "acctestdelegation"

    service_delegation {
      name    = "Microsoft.ContainerInstance/containerGroups"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
}