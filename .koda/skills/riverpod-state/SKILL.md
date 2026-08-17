---
name: riverpod-state
description: |
  Работа с состоянием приложения через Riverpod (flutter_riverpod).
  Используй когда нужно добавить/изменить провайдер, StateNotifier,
  AsyncValue, загрузку данных или управление состоянием.
---

# riverpod-state

## Purpose
Поддерживать единый стиль управления состоянием через Riverpod в проекте.

## When to use
- Добавление нового провайдера или StateNotifier.
- Изменение логики загрузки/обновления данных.
- Работа с `AsyncValue` (loading/error/data).
- Задачи, касающиеся `lib/data/providers/`.

## Instructions
1. Используй `flutter_riverpod` (не provider package).
2. Провайдеры храни в `lib/data/providers/` и экспортируй через `index.dart`.
3. Следуй паттерну `StateNotifierProvider<XNotifier, AsyncValue<T>>` как в `orders_provider.dart` и `auth_provider.dart`.
4. Состояние всегда оборачивай в `AsyncValue`: `AsyncValue.loading()`, `AsyncValue.data(...)`, `AsyncValue.error(e, stack)`.
5. Сервисы внедряй через `Provider` (например, `orderServiceProvider`), а не создавай внутри notifier.
6. В UI читай состояние через `ref.watch(provider)` и обрабатывай через `.when(loading:, error:, data:)`.
7. Действия вызывай через `ref.read(provider.notifier).method()`.
8. Защищай от гонок: флаг `_isInitializing` для предотвращения параллельных загрузок (см. `OrdersNotifier._ensureInitialized`).
9. Ошибки из сервисов пробрасывай как `ApiErrorInfo` (см. `lib/core/utils/api_error_handler.dart`).

## Examples
```dart
final myProvider = StateNotifierProvider<MyNotifier, AsyncValue<MyModel>>(
  (ref) => MyNotifier(ref.watch(myServiceProvider)),
);
```