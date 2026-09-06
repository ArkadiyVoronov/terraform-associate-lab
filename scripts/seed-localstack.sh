#!/usr/bin/env bash
source "$(dirname "$0")/lib/common.sh"

STATE_BUCKET="tf-state-local"
LOCK_TABLE="tf-locks"

log_info "Создаем S3 бакет для state..."
ls_aws s3 mb "s3://$STATE_BUCKET" 2>/dev/null || log_ok "Бакет уже существует"

log_info "Создаем DynamoDB таблицу для locking..."
ls_aws dynamodb create-table \
  --table-name "$LOCK_TABLE" \
  --attribute-definition AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST >/dev/null 2>&1 || log_ok "Таблица уже существует"

log_ok "Seed завершен"
