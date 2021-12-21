variable "environment" {
    type = string
    description = "Environment of configuration"
}

variable "projectName" {
    type = string
    description = "Name of project."
}

variable "app_subscription_id" {
    description = "Subscription ID"
    default = "955922f4-eb1c-4053-aade-664f961df7a1"
  
}

variable "app_client_id" {
    description = "App Client ID"
}

variable "app_client_secret" {
    description = "App Client Secret"
    sensitive = true
  
}

variable "app_tenant_id" {
    description = "App Tenant ID"
    default = "8f90a320-7beb-4bc8-a459-b07fb7f48d4c"
  
}