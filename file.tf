terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

#resource_group
resource "azurerm_resource_group" "rg" {
  name     = "terra_rg"
  location = "Brazil South"
}

#virtual_network within the above resource group
resource "azurerm_virtual_network" "vnet" {
  name                = "teraa_vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/28"]
}

resource "azurerm_subnet" "sub" {
  name                 = "terra-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/29"]
}
