provider "azurerm" {
  features {}
}

# Create a resource group if it doesn't exist
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location

  tags = {
    environment = "salman"
  }
}

data "azurerm_key_vault_secret" "example" {
  name         = "virtualmachinename"
  key_vault_id = "d508624f-a0b7-4fd3-9511-05b18ca02784"
}

output "secret_value" {
  value = data.azurerm_key_vault_secret.example.value
}
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.resource_group_location

  tags = {
    environment = "secret_value"
  }
}
