---
name: flutter-test
description: |
  Написание и запуск тестов Flutter-приложения.
  Используй когда нужно написать тест, исправить падающий тест
  или проверить поведение экранов/логики.
---

# flutter-test

## Purpose
Писать тесты в стиле проекта и поддерживать их зелёными.

## When to use
- Написание новых тестов (widget/unit).
- Исправление падающих тестов.
- Проверка авторизации, заказов, навигации.
- Задачи, касающиеся `test/`.

## Instructions
1. Тесты лежат в `test/` (например, `auth_flow_test.dart`, `widget_test.dart`).
2. Запуск тестов:
   ```bash
   flutter test
   ```
3. Для тестов с Riverpod оборачивай виджеты в `ProviderScope`.
4. Для тестов с сетью используй mock-режим (`USE_MOCK=true` по умолчанию) — реальные HTTP-запросы не делай.
5. Используй `tester.pumpWidget(...)`, `tester.pumpAndSettle()` для асинхронных операций.
6. Проверяй ключевые сценарии: успешный/неудачный логин, отображение заказов, навигацию.
7. Именуй тесты по сценарию: `test('логин с валидными данными показывает главный экран', ...)`.
8. После изменения кода запускай `flutter test` и `flutter analyze`.

## Examples
```dart
testWidgets('показывает экран логина', (tester) async {
  await tester.pumpWidget(const ProviderScope(child: MyApp()));
  expect(find.text('Войти'), findsOneWidget);
});
```