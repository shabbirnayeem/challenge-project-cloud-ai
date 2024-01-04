resource "azurerm_resource_group" "computervision" {
  name     = "vision-rg"
  location = "eastus"
}


resource "azurerm_cognitive_account" "computer_vision_lab" {
  name                  = "computer-vision-sn"
  custom_subdomain_name = "computer-vision-sn"
  location              = azurerm_resource_group.computervision.location
  resource_group_name   = azurerm_resource_group.computervision.name
  sku_name              = "F0"
  kind                  = "ComputerVision"

  network_acls {
    default_action = "Allow"
    ip_rules       = []
  }
}

output "endpoint" {
    value = azurerm_cognitive_account.computer_vision_lab.endpoint
}
