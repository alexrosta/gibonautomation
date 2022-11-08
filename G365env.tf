#config details Terraform
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.31.1"
    }
  }
}

#config details for azure terraform providers
provider "azurerm" {
  features {}
  client_id       = "x"
  client_secret   = "x"
  tenant_id       = "x"
  subscription_id = "x"
}

#resources start here
resource "azurerm_resource_group" "rg" {
  name     = "test-rg"
  location = "westeurope"

}

resource "azurerm_virtual_network" "rg" {
  name                = "network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

}

resource "azurerm_subnet" "rg" {
  name                 = "subnet"
  address_prefixes     = ["10.0.2.0/24"]
  virtual_network_name = azurerm_virtual_network.rg.name
  resource_group_name  = azurerm_resource_group.rg.name
}

resource "azurerm_public_ip" "rg" {
  name                = "publicip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
}

resource "azurerm_network_security_group" "rg" {
  name                = "NSG"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "rdpallow"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "x"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "rg" {
  subnet_id                 = azurerm_subnet.rg.id
  network_security_group_id = azurerm_network_security_group.rg.id

}

resource "azurerm_network_interface" "rg" {
  name                = "nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "intern"
    subnet_id                     = azurerm_subnet.rg.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.2.12"
    public_ip_address_id          = azurerm_public_ip.rg.id
  }
}

resource "azurerm_virtual_desktop_host_pool" "rg" {
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  name                     = "hostpool"
  validate_environment     = true
  type                     = "Pooled"
  maximum_sessions_allowed = 50
  load_balancer_type       = "DepthFirst"
  


}

resource "azurerm_virtual_desktop_application_group" "rg" {
  name                = "appgroup"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  type         = "RemoteApp"
  host_pool_id = azurerm_virtual_desktop_host_pool.rg.id
}

resource "azurerm_virtual_desktop_workspace" "rg" {
  name                = "workspace"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

}

resource "azurerm_virtual_desktop_workspace_application_group_association" "rg" {
  workspace_id         = azurerm_virtual_desktop_workspace.rg.id
  application_group_id = azurerm_virtual_desktop_application_group.rg.id
}