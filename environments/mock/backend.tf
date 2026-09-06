terraform {
  required_version = "~> 1.9"
  
  backend "s3" {
    bucket                      = "tf-state-local"
    key                         = "study/mock/terraform.tfstate"
    region                      = "us-east-1"
    dynamodb_table              = "tf-locks"
    
    # Явно указываем эндпоинты для LocalStack
    endpoints = {
      s3       = "http://localhost:4566"
      dynamodb = "http://localhost:4566"
    }
    
    access_key                  = "test"
    secret_key                  = "test"
    
    # Эти флаги критичны для работы с LocalStack на этапе init
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    
    # Используем новый параметр вместо force_path_style
    use_path_style = true
  }
}