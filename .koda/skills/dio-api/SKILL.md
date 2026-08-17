---
name: dio-api
description: |
  Работа с API-запросами через Dio: сервисы, обработка ошибок, эндпоинты.
  Используй когда нужно добавить запрос к бэкенду, обработать ошибку,
  изменить сервис или работу с сетью.
---

# dio-api

## Purpose
Единый стиль сетевых запросов и обработки ошибок в проекте.

## When to use
- Добавление/изменение API-запроса в сервисах (`lib/data/services/`).
- Обработка ошибок сети и сервера.
- Работа с эндпоинтами, токенами, заголовками.
- Задачи, касающиеся `lib/data/api/`, `lib/core/constants/api_constants.dart`.

## Instructions
1. Все запросы идут через единый экземпляр `DioClient.instance.dio` (см. `lib/data/api/dio_client.dart`).
2. Эндпоинты бери из `ApiConstants` (`lib/core/constants/api_constants.dart`), не хардкодь URL.
3. Сервисы реализуй как классы в `lib/data/services/` и экспортируй через `index.dart`.
4. Ошибки обрабатывай через `ApiErrorHandler.info(e)` и пробрасывай как `ApiErrorInfo` (см. `lib/core/utils/api_error_handler.dart`).
5. В сервисах используй паттерн mock-режима:
   ```dart
   static const bool _useMock = bool.fromEnvironment('USE_MOCK', defaultValue: true);
   if (_useMock) return _mockXxx(...);
   ```
6. Токен не передавай вручную — его добавляет `AuthInterceptor` автоматически.
7. Таймауты уже настроены в `DioClient` (10 сек) — не дублируй.
8. В UI ошибки показывай через `e is ApiErrorInfo ? e.message : '...'`.

## Examples
```dart
try {
  final dio = DioClient.instance.dio;
  final response = await dio.get(ApiConstants.orders);
  return (response.data as List).map((e) => OrderModel.fromJson(e)).toList();
} on DioException catch (e) {
  final info = ApiErrorHandler.info(e);
  throw ApiErrorInfo(type: info.type, message: info.message);
}
```