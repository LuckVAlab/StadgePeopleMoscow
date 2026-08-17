# StadgePeopleMoscow — Backend

Локальный бэкенд на **Express + SQLite** для Flutter-приложения StadgePeopleMoscow.

## Требования

- Node.js v22+ (используется встроенный `node:sqlite`)

## Запуск

```bash
cd backend
npm install
npm start
```

Сервер поднимется на `http://localhost:8080/v1`.

Для разработки с авто-перезагрузкой:

```bash
npm run dev
```

## Тестовые аккаунты

| Роль | Email | Пароль |
|---|---|---|
| Специалист | `user@example.com` | `password123` |
| Заказчик | `client@example.com` | `password123` |

При первом запуске автоматически создаются 2 пользователя и 3 тестовых заказа (seed).

## Эндпоинты

| Метод | Путь | Auth | Описание |
|---|---|---|---|
| POST | `/v1/auth/login` | — | Вход по email + пароль |
| POST | `/v1/auth/register` | — | Регистрация (name, email, phone, password, specialty) |
| POST | `/v1/auth/logout` | ✅ | Выход |
| GET | `/v1/profile` | ✅ | Профиль текущего пользователя |
| PUT | `/v1/profile` | ✅ | Обновление профиля |
| GET | `/v1/orders` | — | Список заказов (`?category=Звукорежиссёр`) |
| POST | `/v1/orders` | ✅ | Создать заказ |
| POST | `/v1/orders/:id/respond` | ✅ | Откликнуться на заказ |
| GET | `/health` | — | Проверка сервера |

## Структура

```
backend/
├── package.json
├── .env                ← JWT_SECRET, PORT
├── .env.example
├── .gitignore
├── src/
│   ├── server.js       ← точка входа (Express)
│   ├── db.js           ← SQLite: схема, seed, хелперы
│   ├── middleware/
│   │   └── auth.js     ← JWT-проверка
│   └── routes/
│       ├── auth.js     ← /auth/login, /auth/register, /auth/logout
│       ├── profile.js  ← GET/PUT /profile
│       └── orders.js   ← GET/POST /orders, POST /orders/:id/respond
└── data/
    └── app.db          ← файл SQLite (gitignored)
```

## База данных

SQLite — один файл `data/app.db`. При удалении файла и перезапуске сервера seed создастся заново.

### Таблицы

- **users** — пользователи (специалисты и заказчики)
- **orders** — заказы
- **order_tags** — теги заказов (text, isUrgent, isGreen)
- **applicants** — отклики специалистов на заказы

## Безопасность

- Пароли хешируются через `bcryptjs` (10 раундов)
- JWT-токены подписываются секретом из `.env` (`JWT_SECRET`)
- Срок жизни токена — 7 дней (`JWT_EXPIRES_IN`)
- Защищённые маршруты требуют заголовок `Authorization: Bearer <token>`

## Переключение Flutter-приложения

В приложении mock-режим отключён по умолчанию (`USE_MOCK=false`).
`baseUrl` указывает на `http://localhost:8080/v1`.

Для возврата к mock-режиму:

```bash
flutter run --dart-define=USE_MOCK=true
```
