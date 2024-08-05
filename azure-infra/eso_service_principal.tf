# Application already exists

# Assign access to Key Vault
resource "azurerm_key_vault_access_policy" "sp_access_policy" {
  key_vault_id = azurerm_key_vault.secrets.id

  tenant_id = var.azure_tenant_id
  object_id = var.object_id

  key_permissions = [
    "Get",
    "List",
  ]

  secret_permissions = [
    "Get",
    "List",
  ]
}

resource "kubernetes_secret" "eso-keyvault-sp" {
  metadata {
    name = "secret-eso-keyvault-sp"
  }

  data = {
    "ClientID"     = var.client_id
    "ClientSecret" = var.client_secret
  }
}
