---
name: go-router-nav
description: |
  Навигация и маршрутизация через go_router.
  Используй когда нужно добавить маршрут, перейти на экран,
  передать параметры или изменить роутер.
---

# go-router-nav

## Purpose
Поддерживать навигацию через go_router в едином стиле.

## When to use
- Добавление нового экрана/маршрута.
- Переходы между экранами (`context.push`, `context.go`).
- Передача данных через `extra` или path-параметры.
- Задачи, касающиеся `lib/core/router/app_router.dart`.

## Instructions
1. Все маршруты регистрируй в `routerProvider` в `lib/core/router/app_router.dart`.
2. Используй `GoRoute(path: ..., builder: ...)` для статических и параметризованных маршрутов.
3. Для маршрутов с параметрами используй `state.pathParameters` (например, `/order/:id`).
4. Объекты передавай через `state.extra` и проверяй тип перед использованием:
   ```dart
   final extra = state.extra;
   OrderModel? order;
   if (extra != null && extra is OrderModel) order = extra;
   ```
5. Переходы: `context.push('/order/${order.id}', extra: order)` — для стековой навигации, `context.go('/home')` — для замены.
6. Глобальный `errorBuilder` уже настроен — не дублируй обработку 404 на каждом экране.
7. `redirect` сейчас отключён (auth временно выключена) — не включай без запроса.
8. Импортируй `package:go_router/go_router.dart` для `context.push/go`.

## Examples
```dart
GoRoute(
  path: '/order/:id',
  builder: (context, state) {
    final orderId = state.pathParameters['id']!;
    return OrderDetailsScreen(orderId: orderId, order: state.extra as OrderModel?);
  },
),
```