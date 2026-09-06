mock_provider "aws" {}

variables {
  vpc_cidr = "10.0.0.0/16"
  env_name = "test"
}

run "check_vpc_cidr" {
  command = plan
  
  assert {
    condition     = aws_vpc.this.cidr_block == "10.0.0.0/16"
    error_message = "VPC CIDR не совпадает с ожидаемым"
  }
}

run "check_subnet_cidr" {
  command = plan
  
  assert {
    condition     = aws_subnet.public.cidr_block == "10.0.1.0/24"
    error_message = "Subnet CIDR рассчитан неверно"
  }
}
