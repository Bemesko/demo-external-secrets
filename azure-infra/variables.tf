variable "azure_tenant_id" {
  description = "Tenant ID to assign to Azure Key Vault"
}

variable "azure_subscription_id" {
  description = "Azure Subscription in which to create the resources"
}

variable "client_id" {
  description = "Client ID to use with External Secrets Operator"
}

variable "object_id" {
  description = "Object ID for the service principal of ESO"
}

variable "client_secret" {
  description = "Secret for External Secret Operator app registration"
  sensitive   = true
}
