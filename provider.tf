# configure aws provider
provider "aws" {
  region  = var.region
  profile = "default"
}

# configure backend
terraform {
  backend "s3" {
    bucket         = "dhsoni-terraform"
    key            = "ecr.terraform.tfstate"
    region         = "us-east-2"
    profile        = "default"
    dynamodb_table = "terraform-state-lock-dynamodb"
  }
}