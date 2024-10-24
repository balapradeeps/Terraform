# To create a multi-cloud serverless framework using Terraform, we can break down the setup into modules for Azure and AWS, and use variables for configuration. Below is a detailed structure with example Terraform scripts.

## Terraform Structure

### Variables

Define variables for configuration:

```hcl
variable "aws_region" {
  default = "us-west-2"
}

variable "azure_location" {
  default = "East US"
}

variable "resource_group_name" {
  default = "example-resources"
}
```

### Modules

#### **1. Azure Module**

Create a module for Azure resources.

**`modules/azure/main.tf`**

```hcl
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.azure_location
}

resource "azurerm_api_management" "example" {
  name                = "example-api-management"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  publisher_name      = "Example Company"
  publisher_email     = "api@example.com"
}

resource "azurerm_eventhub_namespace" "example" {
  name                = "example-eventhubns"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_storage_account" "example" {
  name                     = "examplestoracc"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_notification_hub" "example" {
  name                = "example-notificationhub"
  namespace_name      = azurerm_notification_hub_namespace.example.name
  resource_group_name = azurerm_resource_group.example.name
}
```

**`modules/azure/variables.tf`**

```hcl
variable "resource_group_name" {}
variable "azure_location" {}
```

#### **2. AWS Module**

Create a module for AWS resources.

**`modules/aws/main.tf`**

```hcl
provider "aws" {
  region = var.aws_region
}

resource "aws_api_gateway_rest_api" "example" {
  name        = "example-api-gateway"
  description = "Example API Gateway"
}

resource "aws_sqs_queue" "example" {
  name = "example-queue"
}

resource "aws_s3_bucket" "example" {
  bucket = "example-bucket"
}

resource "aws_sns_topic" "example" {
  name = "example-topic"
}
```

**`modules/aws/variables.tf`**

```hcl
variable "aws_region" {}
```

### Main Configuration

**`main.tf`**

```hcl
module "azure_resources" {
  source              = "./modules/azure"
  resource_group_name = var.resource_group_name
  azure_location      = var.azure_location
}

module "aws_resources" {
  source     = "./modules/aws"
  aws_region = var.aws_region
}
```

### Explanation

- **Variables:** Define reusable parameters such as regions and resource group names.
- **Modules:** Separate configurations for Azure and AWS to maintain clarity and reusability.
- **Main Configuration:** Integrates both modules, passing necessary variables to each.

This setup allows you to manage a multi-cloud environment efficiently using Terraform, with clear separation of concerns and modular design.
