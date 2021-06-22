resource "azurerm_resource_group" "testresorurcegroup" {
  name     = "test-resources"
  location = "West Europe"
}

resource "azurerm_network_security_group" "testsg" {
  name                = "acceptanceTestSecurityGroup1"
  location            = azurerm_resource_group.testresorurcegroup.location
  resource_group_name = azurerm_resource_group.testresorurcegroup.name
}

resource "azurerm_network_ddos_protection_plan" "testddosprotecton" {
  name                = "ddospplan1"
  location            = azurerm_resource_group.testresorurcegroup.location
  resource_group_name = azurerm_resource_group.testresorurcegroup.name
}

resource "azurerm_virtual_network" "testvn" {
  name                = "virtualNetwork1"
  location            = azurerm_resource_group.testresorurcegroup.location
  resource_group_name = azurerm_resource_group.testresorurcegroup.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  ddos_protection_plan {
    id     = azurerm_network_ddos_protection_plan.testddosprotecton.id
    enable = true
  }

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
  }

  subnet {
    name           = "subnet3"
    address_prefix = "10.0.3.0/24"
    security_group = azurerm_network_security_group.example.id
  }

  tags = {
    environment = "Production"
  }
}