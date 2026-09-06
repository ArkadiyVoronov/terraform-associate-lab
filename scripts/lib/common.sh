#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
COMPOSE_FILE="$ROOT_DIR/tests/mocks/docker-compose.mock.yml"
LS_URL="${LOCALSTACK_URL:-http://localhost:4566}"

c_info=$'\033[1;34m'; c_ok=$'\033[1;32m'; c_err=$'\033[1;31m'; c_rst=$'\033[0m'

log_info() { echo "${c_info}[info]${c_rst} $*"; }
log_ok()   { echo "${c_ok}[ ok ]${c_rst} $*"; }
log_err()  { echo "${c_err}[fail]${c_rst} $*" >&2; }

require_cmd() {
  command -v "$1" >/dev/null 2>&1 || { log_err "Не найдена утилита '$1'. Проверь devcontainer."; exit 1; }
}

wait_for_url() {
  local url="$1" name="$2" tries=30
  for ((i=1; i<=tries; i++)); do
    if curl -fsS "$url" >/dev/null 2>&1; then
      log_ok "$name готов"
      return 0
    fi
    sleep 2
  done
  log_err "$name не ответил за $((tries*2)) сек"
  return 1
}

# Хелпер для вызова AWS CLI против LocalStack
ls_aws() {
  docker compose -f "$COMPOSE_FILE" exec -T localstack awslocal "$@"
}
