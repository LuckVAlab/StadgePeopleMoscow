const { DatabaseSync } = require('node:sqlite');
const path = require('node:path');
const fs = require('node:fs');
const bcrypt = require('bcryptjs');

const dataDir = path.join(__dirname, '..', 'data');
if (!fs.existsSync(dataDir)) {
  fs.mkdirSync(dataDir, { recursive: true });
}

const db = new DatabaseSync(path.join(dataDir, 'app.db'));

// ─── Schema ───
db.exec(`
  PRAGMA journal_mode = WAL;
  PRAGMA foreign_keys = ON;

  CREATE TABLE IF NOT EXISTS users (
    id            TEXT PRIMARY KEY,
    name          TEXT NOT NULL,
    email         TEXT UNIQUE NOT NULL,
    phone         TEXT,
    password_hash TEXT NOT NULL,
    role          TEXT NOT NULL DEFAULT 'specialist',
    specialty     TEXT,
    rating        REAL NOT NULL DEFAULT 0.0,
    reviews_count INTEGER NOT NULL DEFAULT 0,
    equipment     TEXT NOT NULL DEFAULT '[]',
    skills        TEXT NOT NULL DEFAULT '[]',
    calendar      TEXT NOT NULL DEFAULT '{}',
    subscription  TEXT NOT NULL DEFAULT 'Free',
    created_at    TEXT NOT NULL,
    updated_at    TEXT NOT NULL
  );

  CREATE TABLE IF NOT EXISTS orders (
    id                    TEXT PRIMARY KEY,
    title                 TEXT NOT NULL,
    description           TEXT NOT NULL,
    category              TEXT NOT NULL,
    price                 TEXT NOT NULL,
    price_cents           INTEGER,
    date                  TEXT NOT NULL,
    order_date            TEXT,
    location              TEXT NOT NULL,
    time                  TEXT NOT NULL,
    client_id             TEXT NOT NULL,
    client_name           TEXT NOT NULL,
    client_phone          TEXT NOT NULL,
    client_rating         REAL,
    selected_specialist_id TEXT,
    status                TEXT NOT NULL DEFAULT 'open',
    is_urgent             INTEGER NOT NULL DEFAULT 0,
    created_at            TEXT NOT NULL,
    updated_at            TEXT NOT NULL
  );

  CREATE TABLE IF NOT EXISTS order_tags (
    id        INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id  TEXT NOT NULL,
    text      TEXT NOT NULL,
    is_urgent INTEGER NOT NULL DEFAULT 0,
    is_green  INTEGER NOT NULL DEFAULT 0
  );

  CREATE TABLE IF NOT EXISTS applicants (
    id            INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id      TEXT NOT NULL,
    specialist_id TEXT NOT NULL,
    created_at    TEXT NOT NULL
  );
`);

// ─── Helpers ───
function nowIso() {
  return new Date().toISOString();
}

function rowToUser(row) {
  if (!row) return null;
  const { password_hash, ...user } = row;
  return {
    ...user,
    equipment: JSON.parse(user.equipment || '[]'),
    skills: JSON.parse(user.skills || '[]'),
    calendar: JSON.parse(user.calendar || '{}'),
  };
}

function rowToOrder(row) {
  if (!row) return null;
  const tags = db
    .prepare('SELECT text, is_urgent, is_green FROM order_tags WHERE order_id = ? ORDER BY id')
    .all(row.id)
    .map((t) => ({
      text: t.text,
      isUrgent: !!t.is_urgent,
      isGreen: !!t.is_green,
    }));

  const applicants = db
    .prepare('SELECT specialist_id FROM applicants WHERE order_id = ? ORDER BY id')
    .all(row.id)
    .map((a) => a.specialist_id);

  return {
    id: row.id,
    title: row.title,
    description: row.description,
    category: row.category,
    price: row.price,
    priceCents: row.price_cents,
    date: row.date,
    orderDate: row.order_date,
    location: row.location,
    time: row.time,
    tags,
    clientId: row.client_id,
    clientName: row.client_name,
    clientPhone: row.client_phone,
    clientRating: row.client_rating,
    applicants,
    selectedSpecialistId: row.selected_specialist_id,
    status: row.status,
    createdAt: row.created_at,
    updatedAt: row.updated_at,
    isUrgent: !!row.is_urgent,
  };
}

// ─── Seed ───
function seed() {
  const count = db.prepare('SELECT COUNT(*) AS c FROM users').get().c;
  if (count > 0) return;

  const hash = bcrypt.hashSync('password123', 10);
  const now = nowIso();

  const insertUser = db.prepare(`
    INSERT INTO users (id, name, email, phone, password_hash, role, specialty, rating, reviews_count, equipment, skills, calendar, subscription, created_at, updated_at)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  `);

  insertUser.run(
    'user_001', 'Алексей Петров', 'user@example.com', '+7 (999) 111-22-33',
    hash, 'specialist', 'Звукорежиссёр', 4.9, 23,
    JSON.stringify(['DiGiCo SD10', 'Yamaha QL5', 'Sennheiser IEM']),
    JSON.stringify(['Звуковой баланс', 'Работа с мониторами', 'Миксирование вживую']),
    JSON.stringify({ 1: true, 2: false, 15: true }),
    'EventOS Pro', now, now,
  );

  insertUser.run(
    'user_002', 'Мария Соколова', 'client@example.com', '+7 (999) 222-33-44',
    hash, 'client', 'Заказчик', 4.8, 12,
    JSON.stringify([]), JSON.stringify([]), JSON.stringify({}),
    'Free', now, now,
  );

  const insertOrder = db.prepare(`
    INSERT INTO orders (id, title, description, category, price, price_cents, date, order_date, location, time, client_id, client_name, client_phone, client_rating, status, is_urgent, created_at, updated_at)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  `);

  insertOrder.run(
    'order_001', 'FOH-инженер, фестиваль', 'Работа на большом фестивале, 3 сцены',
    'Звукорежиссёр', '25 000 ₽', 2500000, '15 авг', '2026-08-15T00:00:00.000Z',
    'Москва', '12:00–02:00', 'user_002', 'Мария Соколова', '+7 (999) 222-33-44', 4.8,
    'open', 1, now, now,
  );
  insertOrder.run(
    'order_002', 'Бэклайнер, клубный тур', 'Тур по клубам России, 5 городов',
    'Бэклайнер', '18 000 ₽', 1800000, '20–22 авг', '2026-08-20T00:00:00.000Z',
    'СПб', '3 дня', 'user_002', 'Мария Соколова', '+7 (999) 222-33-44', 4.8,
    'open', 0, now, now,
  );
  insertOrder.run(
    'order_003', 'Monitor-инженер', 'Корпоративное мероприятие',
    'Техник', '20 000 ₽', 2000000, '18 авг', '2026-08-18T00:00:00.000Z',
    'Москва', '16:00–00:00', 'user_002', 'Мария Соколова', '+7 (999) 222-33-44', 4.8,
    'open', 0, now, now,
  );

  const insertTag = db.prepare(
    'INSERT INTO order_tags (order_id, text, is_urgent, is_green) VALUES (?, ?, ?, ?)',
  );
  insertTag.run('order_001', 'Срочно', 1, 0);
  insertTag.run('order_001', 'DiGiCo SD5', 0, 0);
  insertTag.run('order_001', 'Опыт 3+ года', 0, 0);
  insertTag.run('order_002', 'Fender, Marshall', 0, 0);
  insertTag.run('order_002', 'Свой сетап', 0, 1);
  insertTag.run('order_003', 'Yamaha Rivage', 0, 0);
  insertTag.run('order_003', 'In-Ear', 0, 0);

  console.log('✅ Seed data created (2 users, 3 orders)');
}

seed();

module.exports = { db, rowToUser, rowToOrder, nowIso };