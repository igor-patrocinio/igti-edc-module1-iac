provider "aws" {
    region = var.aws_region
}

# Centralizando o arquivo de controle de estado do TF
terraform {
  backend "s3" {
    bucket  = "terraform-state-igti-igor"
    key     = "state/igti/edc/mod1/terraform.tfstate"
    region  = "us-east-2"
  }
}