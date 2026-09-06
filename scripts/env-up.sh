#!/usr/bin/env bash
source "$(dirname "$0")/lib/common.sh"

log_info "🚀 Поднимаем мок-окружение..."
require_cmd docker

# 1. Запуск LocalStack
docker compose -f "$COMPOSE_FILE" up -d --quiet-pull
wait_for_url "$LS_URL/_localstack/health" "LocalStack"

# 2. Seed данных (бакеты для state и locking)
bash "$(dirname "$0")/seed-localstack.sh"

log_ok "✅ Окружение готово! Можно запускать terraform init."
