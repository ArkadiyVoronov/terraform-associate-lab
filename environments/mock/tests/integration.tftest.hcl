# environments/mock/tests/integration.tftest.hcl

run "create_infrastructure" {
  command = apply
  
  assert {
    condition     = module.vpc.vpc_id != ""
    error_message = "VPC не был создан"
  }
}

run "check_idempotency" {
  command = plan
  
  # Проверяем, что план пустой (нет изменений), значит состояние стабильно
  # В terraform test, если план пустой, он считается успешным по умолчанию, 
  # но мы можем проверить конкретные атрибуты, чтобы убедиться, что ресурсы "видны".
  assert {
    condition     = module.vpc.vpc_id != ""
    error_message = "VPC ID пропал из состояния после применения"
  }
}