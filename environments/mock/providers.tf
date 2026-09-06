locals {
  ls_url = coalesce(getenv("LOCALSTACK_URL"), "http://localhost:4566")
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  
  # Отключаем все проверки, которые требуют реального доступа к AWS
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  skip_region_validation      = true
  
  endpoints {
    s3       = local.ls_url
    ec2      = local.ls_url
    iam      = local.ls_url
    sts      = local.ls_url
    dynamodb = local.ls_url
    logs     = local.ls_url
  }
}