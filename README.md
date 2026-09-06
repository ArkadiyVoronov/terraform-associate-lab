# Terraform Associate Lab 🚀

Репозиторий для подготовки к сертификации **HashiCorp Terraform Associate (004)**.
Проект реализует полноценный DevOps-подход: модульная структура, автотесты и полная изоляция от облачных провайдеров через локальные моки (LocalStack).

## 🌟 Особенности
- ✅ **Покрытие тем экзамена**: State management, Modules, Variables, Outputs, Lifecycle.
- 🚫 **No Cloud Costs**: Использует **LocalStack** (эмуляция AWS).
- 🧪 **Тестирование**: Unit-тесты (`mock_provider`) и Integration-тесты (`terraform test`).
- 🔄 **Codespaces Ready**: Автоматическая настройка среды при открытии.

## 🚀 Быстрый старт

### Требования
- Docker & Docker Compose
- Terraform >= 1.9

### Запуск в терминале
1. Поднимите локальное окружение:
   ```bash
   make env-up

2. Инициализируйте Terraform:
   ```bash
   cd environments/mock && terraform init
   
3. Примените инфраструктуру:
   ```bash
   terraform apply

### Тестирование
   ```bash
   make test-unit        # Быстрые unit-тесты модулей
   make test-integration # Полные тесты против LocalStack
   make smoke            # Полный цикл: up -> test -> down
   ```
### 📚 Изучение тем
Этот проект покрывает следующие темы сертификации:

   - 1.**IaC Concepts**: Декларативное описание инфраструктуры.
   - 2.**Terraform Basics**: Providers, Resources, Data Sources.
   - 3.**State Management**: Remote backend (S3) и Locking (DynamoDB) в LocalStack.
   - 4.**Modules**: Создание и использование переиспользуемых модулей.
   - 5.**Testing**: Использование terraform test для валидации кода.
