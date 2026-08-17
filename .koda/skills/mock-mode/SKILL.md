---
name: mock-mode
description: |
  Разработка и тестирование без реального бэкенда через mock-режим.
  Используй когда нужно добавить мок-данные, мок-реализацию сервиса
  или работать с флагом USE_MOCK.
---

# mock-mode

## Purpose
Поддерживать mock-режим для разработки без бэкенда.

## When to use
- Добавление мок-данных или мок-реализаций в сервисы.
- Работа с флагом `USE_MOCK`.
- Демонстрация/тестирование UI без реального API.

## Instructions
1. Mock-режим включается флагом сборки:
   ```bash
   flutter run --dart-define=USE_MOCK=true
   ```
   По умолчанию `USE_MOCK` = `true` (см. сервисы).
2. В каждом сервисе объявляй:
   ```dart
   static const bool _useMock = bool.fromEnvironment('USE_MOCK', defaultValue: true);
   ```
3. В начале каждого метода проверяй `if (_useMock) return _mockXxx(...);` — реальный код идёт после.
4. Мок-реализации называй `_mockXxx` и размещай в секции `// ─── Mock implementations ───` в конце класса.
5. Мок-данные должны быть реалистичными (примеры в `order_service.dart`: заказы с ценами, тегами, клиентами).
6. Имитируй задержку сети: `await Future.delayed(const Duration(milliseconds: 500));`.
7. Мок-токены генерируй уникальными: `'mock_token_${DateTime.now().millisecondsSinceEpoch}'`.
8. Не смешивай мок-логику с реальной — держи их раздельно.

## Examples
```dart
Future<List<OrderModel>> getOrders({String? category}) async {
  if (_useMock) return _mockGetOrders(category: category);
  // ... реальный запрос через Dio
}
```