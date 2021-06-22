###########
# Defaults
##########

provider "aws" {
  region = var.region
}

terraform {
  required_version = ">= 1.0.0"
  backend "remote" {}
}

