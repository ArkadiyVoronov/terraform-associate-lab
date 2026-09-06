resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "tf-study-${var.env_name}-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 1) # 10.0.1.0/24
  availability_zone = "us-east-1a"

  tags = {
    Name = "tf-study-${var.env_name}-public-subnet"
  }
}
