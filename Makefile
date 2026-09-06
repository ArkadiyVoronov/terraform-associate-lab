.PHONY: env-up env-down test-unit test-integration help

help: ## Показать список команд
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | awk 'BEGIN{FS=":.*?## "}{printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

env-up: ## Поднять окружение (LocalStack)
	bash scripts/env-up.sh

env-down: ## Остановить окружение
	docker compose -f tests/mocks/docker-compose.mock.yml down -v

test-unit: ## Запустить unit-тесты (быстро, без Docker)
	cd modules/network && terraform init -backend=false && terraform test

test-integration: ## Запустить интеграционные тесты (требует env-up)
	cd environments/mock && terraform init && terraform test

smoke: ## Полный цикл проверки
	make env-up
	make test-integration
	make env-down
