terraform {
    backend "remote" {}
}

provider "azurerm"{
    features {}

    subscription_id = var.app_subscription_id
    client_id = var.app_client_id
    client_secret = var.app_client_secret
    tenant_id = var.app_tenant_id
    skip_provider_registration = true

}

resource "azurerm_resource_group" "rg" {
    name = "${var.environment}-${var.projectName}"
    location = "West Europe"
}


resource "azurerm_app_service_plan" "plan" {
    name = "${local.prefix}-asp"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    kind = "Linux"
    sku {
        tier = "Free"
        size = "F1"
    }
}

resource "azurerm_app_service" "app" {
    name = "${local.prefix}-app"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    app_service_plan_id = azurerm_app_service_plan.plan.id
}

locals {
  prefix = "${var.environment}-${var.projectName}"
}

data "terraform_remote_state" "state" {
    backend = "remote"
    config = {
        organization = "FYP-Bot"
        workspaces = {
            name = "${var.tf_state_workspace}"
        }
    }
}
