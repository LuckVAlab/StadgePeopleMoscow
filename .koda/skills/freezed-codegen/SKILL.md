---
name: freezed-codegen
description: |
  Работа с моделями данных на freezed + json_serializable.
  Используй когда нужно изменить модель, добавить поле, поправить
  сериализацию или перегенерировать код.
---

# freezed-codegen

## Purpose
Правильно изменять модели данных и генерировать код в проекте.

## When to use
- Изменение существующей модели в `lib/data/models/`.
- Добавление новой freezed-модели.
- Проблемы с сериализацией JSON (`.g.dart`).
- Задачи, где упоминаются `@freezed`, `build_runner`, `.freezed.dart`, `.g.dart`.

## Instructions
1. Модели лежат в `lib/data/models/` (например, `auth_model.dart`, `order_model.dart`).
2. Описывай модель аннотацией `@freezed sealed class X with _$X` + `factory X.fromJson`.
3. НИКОГДА не редактируй вручную сгенерированные файлы `*.freezed.dart` и `*.g.dart` — они перезаписываются.
4. После изменения модели обязательно перегенерируй код:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```
5. Для полей с дефолтами используй `@Default(...)` (например, `@Default([]) List<String> skills`).
6. Для необязательных полей используй nullable-типы (`int? priceCents`).
7. Комментарии к полям пиши через `///` — они попадают в сгенерированный код.
8. После генерации проверь, что `flutter analyze` не выдаёт ошибок.

## Examples
```dart
@freezed
sealed class MyModel with _$MyModel {
  const factory MyModel({
    required String id,
    @Default(0) int count,
    String? note,
  }) = _MyModel;

  factory MyModel.fromJson(Map<String, dynamic> json) =>
      _$MyModelFromJson(json);
}
```