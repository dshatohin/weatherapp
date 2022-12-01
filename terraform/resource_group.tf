# Creates resource group
resource "azurerm_resource_group" "main" {
  name     = "main-resources"
  location = "West Europe"
}
