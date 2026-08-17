---
name: storage-session
description: |
  Работа с хранением токена, сессией пользователя и профилем.
  Используй когда нужно изменить логику авторизации, сохранение
  токена, восстановление сессии или работу с профилем.
---

# storage-session

## Purpose
Поддерживать единый подход к хранению сессии и профиля.

## When to use
- Изменение логики логина/регистрации/логаута.
- Работа с токеном, восстановлением сессии.
- Сохранение/обновление профиля пользователя.
- Задачи, касающиеся `lib/data/services/storage_service.dart`, `auth_service.dart`, `auth_provider.dart`.

## Instructions
1. Хранилище — синглтон `StorageService.instance` (`lib/data/services/storage_service.dart`). Всегда обращайся через `.instance`.
2. Перед использованием хранилища вызови `StorageService.instance.init()` (один раз при старте приложения).
3. Токен сохраняй через `setToken`, читай через `getToken`, удаляй через `clearToken` (также чистит данные пользователя).
4. Профиль сохраняй как JSON-строку: `setUser(jsonEncode(user.toJson()))`.
5. Токен в HTTP-заголовки добавляет `AuthInterceptor` (`lib/data/api/dio_client.dart`) — не дублируй.
6. При 401 `AuthInterceptor` сам очищает токен — не очищай вручную в сервисах.
7. Восстановление сессии — в `AuthNotifier._restoreSession()` (`lib/data/providers/auth_provider.dart`): читает токен, восстанавливает пользователя, ставит `AuthStatus.authenticated`.
8. После логина/регистрации: сохрани токен + пользователя + `DioClient.authInterceptor.setToken(token)`.
9. При логауте: очисти токен в хранилище и в интерцепторе (см. `AuthService.logout`).

## Examples
```dart
_storage.setToken(data.token);
_storage.setUser(jsonEncode(data.toJson()));
DioClient.authInterceptor.setToken(data.token);
```