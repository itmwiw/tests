terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "3.12.0"
    }
  }
  #backend "kubernetes" {}
}


provider "vault" {
  skip_tls_verify = var.skip_tls_verify
  address = var.auth.address
  #token = file("${var.auth.token_filepath}")
  max_lease_ttl_seconds = 30
  auth_login_jwt {
    role = var.auth.role
    jwt = file("${var.auth.jwt_filepath}")
    mount = var.auth.mount
  }

}


resource "vault_azure_secret_backend" "azure" {
  path                    = var.backend
  use_microsoft_graph_api = true
  subscription_id         = var.subscription_id
  tenant_id               = var.tenant_id
  client_id               = var.client_id
  client_secret           = var.client_secret
  environment             = "AzurePublicCloud"
}
