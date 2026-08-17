# AGENTS.md — Правила проекта StadgePeopleMoscow

Маркетплейс мероприятий и услуг (заказчики ↔ специалисты) для Москвы.
Монорепозиторий: Flutter-приложение (фронтенд) + NestJS API (бэкенд).

## Структура репозитория

```
├── lib/          # Flutter-приложение
│   ├── main.dart # Точка входа: init StorageService → ProviderScope → MaterialApp.router
│   ├── core/     # Не зависит от бизнес-логики
│   │   ├── constants/  # api_constants.dart (baseUrl, эндпоинты), app_constants.dart
│   │   ├── router/     # app_router.dart (go_router, routerProvider)
│   │   ├── theme/      # app_theme.dart (тёмная тема)
│   │   └── utils/      # api_error_handler.dart (ApiErrorInfo, ApiErrorType)
│   ├── data/     # Данные: модели, сервисы, состояние
│   │   ├── api/        # dio_client.dart (DioClient + AuthInterceptor, синглтоны)
│   │   ├── models/     # freezed-модели (X.dart + X.freezed.dart + X.g.dart)
│   │   ├── providers/  # Riverpod-провайдеры (StateNotifier + AsyncValue)
│   │   └── services/   # Dio-сервисы (auth, orders), storage_service.dart
│   ├── screens/  # Экраны (login, register, main, order_details, create_order, profile, feed)
│   ├── widgets/  # Переиспользуемые виджеты (app_dropdown, app_card, app_text_field, app_tag)
│   └── theme/
├── backend/      # NestJS + Prisma + PostgreSQL + Redis + Docker
│   ├── src/           # auth, users, orders, categories, bookings, database
│   ├── prisma/        # schema.prisma (8 таблиц)
│   └── docker-compose.yml
├── test/         # Widget-тесты (auth_flow_test.dart, widget_test.dart)
└── .koda/skills/ # Скиллы для AI-ассистента (см. ниже)
```

## Технологический стек

**Фронтенд (Flutter, SDK ^3.5.0):**
- `flutter_riverpod` ^2.5.1 — состояние: `StateNotifierProvider<..., AsyncValue<...>>`
- `dio` ^5.7.0 — сеть: синглтон `DioClient.instance` + `AuthInterceptor`
- `go_router` ^14.2.0 — навигация: `routerProvider`
- `freezed` ^3.2.5 + `json_serializable` — модели (sealed-классы)
- `shared_preferences` — хранение токена/пользователя (`StorageService.instance`)

**Бэкенд (NestJS + TypeScript):**
- Prisma ORM, PostgreSQL 16, Redis 7
- JWT (access + refresh), bcrypt
- API: `/api/v1/*`, Swagger: `/api/docs`

## Ключевые паттерны и конвенции

### Слои и зависимости
- Направление зависимостей строго вниз: `screens` → `widgets`/`data` → `core`.
- `core/` не импортирует `data/` и `screens/`.
- Модели ничего не знают о провайдерах/сервисах — только аннотации freezed.

### Модели (freezed)
- Модель в `lib/data/models/<name>_model.dart`: `@freezed sealed class` + `part` для `.freezed.dart` и `.g.dart`.
- Поля с `///`-документацией, если смысл не очевиден (например, `price` — сырая строка для отображения, `priceCents` — для сортировки).
- Значения по умолчанию через `@Default(...)` (списки, булевы флаги, статусы).
- После изменения модели — обязательный реген: `dart run build_runner build --delete-conflicting-outputs`.
- Экспорт моделей через баррел-файл `lib/data/models/index.dart`.

### Сервисы (Dio)
- Синглтоны для общих ресурсов: `StorageService.instance`, `DioClient.instance`, `DioClient.authInterceptor`.
- Методы сервиса: возвращают модель, бросают `ApiErrorInfo` (не сырой `DioException`).
- Ошибки обрабатываются через `ApiErrorHandler.info(e)` → `ApiErrorInfo(type, message)`.
- Токен персистится через `_storage.setToken/setUser` + `authInterceptor.setToken` (все три места синхронно).

### Провайдеры (Riverpod)
- `StateNotifierProvider<Notifier, AsyncValue<T>>` — стандарт проекта.
- Ленивая загрузка: флаги `_initialized` / `_isInitializing` (защита от параллельных вызовов).
- Ошибки: `state = AsyncValue.error(message, stack)`; на успех — `AsyncValue.data(...)`.
- В сообщениях ошибок для пользователя — человекочитаемые русские строки (`'Ошибка загрузки заказов'` и т.п.).
- Провайдеры экспортируются через баррел-файлы (`index.dart`).

### Навигация (go_router)
- Все маршруты — в `lib/core/router/app_router.dart`, провайдер `routerProvider`.
- Передача объекта через `state.extra` (например, `OrderModel` в `/order/:id`).
- Редирект и auth-гарды — через `redirect` в `GoRouter`.

### Мок-режим
- Флаг: `static const bool _useMock = bool.fromEnvironment('USE_MOCK', defaultValue: true)`.
- Запуск с моками: `flutter run --dart-define=USE_MOCK=true`.
- Мок-реализации — внутри сервиса, приватные методы `_mockXxx()`, с имитацией задержки (`Future.delayed`).
- Тесты используют `ProviderScope(overrides: [...])` с подклассами сервисов — не полагаются на мок-режим.

### UI и текст
- Все пользовательские строки — на русском, в коде напрямую (без i18n-фреймворка).
- Переиспользуемые компоненты — в `lib/widgets/` (AppCard, AppTextField, AppTag, AppDropdown).
- Тёмная тема `AppTheme.darkTheme`.

### Стиль кода
- База: `flutter_lints` + в `analysis_options.yaml`: `prefer_single_quotes`, `sort_pub_dependencies`, `unawaited_futures`.
- Импорты — относительные (пример: `import '../../core/constants/api_constants.dart'`).
- Перед сдачей: `flutter analyze` без ошибок, `flutter test` зелёный.

## Команды

```bash
flutter pub get                          # установка зависимостей
dart run build_runner build --delete-conflicting-outputs  # регенерация freezed/json
flutter run --dart-define=USE_MOCK=true  # запуск с моками (режим по умолчанию)
flutter analyze                         # статический анализ
flutter test                            # тесты
```

Бэкенд:
```bash
cd backend && docker-compose up -d          # поднять PostgreSQL + Redis + API
docker-compose exec backend npm run prisma:migrate:deploy  # миграции
```

## Правила для AI-ассистента

1. **Минимальные изменения.** Не рефакторить то, что не относится к задаче, не менять существующую логику без запроса.
2. **Соблюдать скиллы** из `.koda/skills/` при работе с соответствующей областью:
   - `storage-session` — токен, сессия, профиль
   - `riverpod-state` — провайдеры, состояние
   - `mock-mode` — мок-данные, USE_MOCK
   - `go-router-nav` — маршруты, навигация
   - `freezed-codegen` — модели, сериализация
   - `flutter-widget` — виджеты, экраны, UI
   - `flutter-test` — тесты
   - `dio-api` — API-запросы, обработка ошибок
3. **Следовать существующим паттернам** проекта (см. выше): не вводить новые архитектурные подходы без обсуждения.
4. **Ошибки пользователю** — всегда через `ApiErrorInfo` с русским сообщением.
5. **Не удалять и не перемещать файлы** вне области задачи; после изменения freezed-моделей обязательно перегенерировать код.
6. **Тесты.** После изменения логики — запускать `flutter test`, добавлять тесты на новую функциональность.
7. **Не выполнять git-мутации** (commit/push/reset/rebase) без явного разрешения пользователя.
