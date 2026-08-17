const { Router } = require('express');
const { db, rowToOrder, nowIso } = require('../db');
const { authMiddleware } = require('../middleware/auth');

const router = Router();

// ─── GET /orders ───
router.get('/', (req, res) => {
  const { category } = req.query;

  let rows;
  if (category && category !== 'Все') {
    rows = db.prepare('SELECT * FROM orders WHERE category = ? ORDER BY created_at DESC').all(category);
  } else {
    rows = db.prepare('SELECT * FROM orders ORDER BY created_at DESC').all();
  }

  return res.json(rows.map(rowToOrder));
});

// ─── POST /orders ───
router.post('/', authMiddleware, (req, res) => {
  const user = req.user;
  const body = req.body;

  const id = `order_${Date.now()}`;
  const now = nowIso();

  db.prepare(`
    INSERT INTO orders (id, title, description, category, price, price_cents, date, order_date, location, time, client_id, client_name, client_phone, client_rating, status, is_urgent, created_at, updated_at)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  `).run(
    id,
    body.title || '',
    body.description || '',
    body.category || '',
    body.price || '',
    body.priceCents ?? null,
    body.date || '',
    body.orderDate || null,
    body.location || '',
    body.time || '',
    user.id,
    user.name,
    user.phone || 'Не указан',
    user.rating || null,
    body.status || 'open',
    body.isUrgent ? 1 : 0,
    now,
    now,
  );

  // Insert tags
  if (Array.isArray(body.tags)) {
    const insertTag = db.prepare('INSERT INTO order_tags (order_id, text, is_urgent, is_green) VALUES (?, ?, ?, ?)');
    for (const tag of body.tags) {
      insertTag.run(id, tag.text || '', tag.isUrgent ? 1 : 0, tag.isGreen ? 1 : 0);
    }
  }

  const order = rowToOrder(db.prepare('SELECT * FROM orders WHERE id = ?').get(id));
  return res.status(201).json(order);
});

// ─── POST /orders/:id/respond ───
router.post('/:id/respond', authMiddleware, (req, res) => {
  const { id } = req.params;
  const { specialistId } = req.body;

  if (!specialistId) {
    return res.status(422).json({ errors: { specialistId: 'Не указан ID специалиста' } });
  }

  const orderRow = db.prepare('SELECT * FROM orders WHERE id = ?').get(id);
  if (!orderRow) {
    return res.status(404).json({ message: 'Заказ не найден' });
  }

  // Check if already applied
  const existing = db.prepare('SELECT id FROM applicants WHERE order_id = ? AND specialist_id = ?').get(id, specialistId);
  if (existing) {
    return res.status(400).json({ message: 'Вы уже откликнулись на этот заказ' });
  }

  const now = nowIso();
  db.prepare('INSERT INTO applicants (order_id, specialist_id, created_at) VALUES (?, ?, ?)').run(id, specialistId, now);

  const order = rowToOrder(db.prepare('SELECT * FROM orders WHERE id = ?').get(id));
  return res.json(order);
});

module.exports = router;