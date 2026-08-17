---
name: flutter-widget
description: |
  Создание и правка Flutter-виджетов, экранов и UI-компонентов.
  Используй когда пользователь просит создать экран, форму, карточку,
  изменить UI, добавить виджет или отредактировать интерфейс.
---

# flutter-widget

## Purpose
Создавать и поддерживать UI-компоненты в стиле проекта StagePeopleMoscow.

## When to use
- Пользователь просит создать/изменить экран, виджет, форму, карточку.
- Нужно добавить новый UI-элемент в существующий экран.
- Задача касается `lib/screens/`, `lib/widgets/` или `lib/theme/`.

## Instructions
1. Изучи существующие виджеты в `lib/widgets/` (AppCard, AppTextField, AppDropdown, AppTag) и переиспользуй их вместо написания с нуля.
2. Используй централизованную тему `AppTheme` из `lib/core/theme/app_theme.dart` (цвета, текстовые стили, ThemeData) — не хардкодь цвета и стили.
3. Придерживайся тёмной темы: фон `AppTheme.background`, поверхности `AppTheme.surface`, текст `AppTheme.textPrimary/textSecondary`.
4. Экраны делай как `ConsumerStatefulWidget` (если нужен доступ к Riverpod) или `StatelessWidget` (если нет).
5. Формы валидируй через `Form` + `GlobalKey<FormState>` + `validator`, как в `create_order_screen.dart`.
6. Контроллеры текстовых полей создавай в `initState` и освобождай в `dispose`.
7. Состояние загрузки показывай через `CircularProgressIndicator` внутри кнопки/экрана.
8. Ошибки пользователю показывай через `ScaffoldMessenger.of(context).showSnackBar(...)`.
9. Соблюдай форматирование: 2 пробела, одинарные кавычки, trailing commas.

## Examples
- Новый экран: `ConsumerStatefulWidget` + `Scaffold` + `AppBar` + `SingleChildScrollView` + переиспользование `AppTextField`.
- Карточка заказа: `AppCard(onTap: ..., child: ...)` с `AppTheme.subtitle` для заголовка.