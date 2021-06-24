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

#create a terraform tf file
terraform {
  backend "azurerm" {
    resource_group_name   = "kopicloud-tstate-rg"
    storage_account_name  = "kopicloudtfstate8132"
    container_name        = "tfstate1"
    key                   = "tfstatefiles"
  }
}
#access_key: FoCDVuCj/c/672NJuoNmRNhTwIt+pEsspcK30rVkDU2xxD9+MaV10OwD9qtXTKyKU7DNYzcj7U8eXIH6pI+SdQ==
