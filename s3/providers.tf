# Configuración del proveedor AWS en la región
provider "aws" {
  region = var.region
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.24.0"
    }
  }
  required_version = "1.6.3"
}