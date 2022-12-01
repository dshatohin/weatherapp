# Creates domain
resource "azurerm_dns_zone" "zone" {
  name                = var.dns_zone
  resource_group_name = azurerm_resource_group.main.name
}

# Creates records
resource "azurerm_dns_a_record" "root_record" {
  name                = "@"
  zone_name           = azurerm_dns_zone.zone.name
  resource_group_name = azurerm_resource_group.main.name
  ttl                 = 600
  records             = [ azurerm_public_ip.frontend.ip_address ]
}

resource "azurerm_dns_a_record" "api_record" {
  name                = "api"
  zone_name           = azurerm_dns_zone.zone.name
  resource_group_name = azurerm_resource_group.main.name
  ttl                 = 600
  records             = [ azurerm_public_ip.backend.ip_address ]
}
