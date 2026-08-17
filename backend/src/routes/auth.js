const { Router } = require('express');
const bcrypt = require('bcryptjs');
const { db, rowToUser, nowIso } = require('../db');
const { createToken, authMiddleware } = require('../middleware/auth');

const router = Router();

// ─── POST /auth/login ───
router.post('/login', (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(422).json({
      errors: { email: !email ? 'Введите email' : undefined, password: !password ? 'Введите пароль' : undefined },
    });
  }

  const row = db.prepare('SELECT * FROM users WHERE email = ?').get(email);
  if (!row || !bcrypt.compareSync(password, row.password_hash)) {
    return res.status(401).json({ message: 'Неверный email или пароль' });
  }

  const user = rowToUser(row);
  const token = createToken(user.id, user.email, user.role);

  return res.json({
    token,
    userId: user.id,
    name: user.name,
    email: user.email,
    role: user.role,
    specialty: user.specialty,
    rating: user.rating,
    reviewsCount: user.reviews_count,
    equipment: user.equipment,
    skills: user.skills,
    calendar: user.calendar,
    subscription: user.subscription,
  });
});

// ─── POST /auth/register ───
router.post('/register', (req, res) => {
  const { name, email, phone, password, specialty } = req.body;

  const errors = {};
  if (!name) errors.name = 'Введите имя';
  if (!email) errors.email = 'Введите email';
  if (!phone) errors.phone = 'Введите телефон';
  if (!password) errors.password = 'Введите пароль';
  if (!specialty) errors.specialty = 'Выберите специальность';
  if (password && password.length < 6) errors.password = 'Пароль должен быть не менее 6 символов';

  if (Object.keys(errors).length > 0) {
    return res.status(422).json({ errors });
  }

  const existing = db.prepare('SELECT id FROM users WHERE email = ?').get(email);
  if (existing) {
    return res.status(422).json({ errors: { email: 'Пользователь с таким email уже существует' } });
  }

  const id = `user_${Date.now()}`;
  const hash = bcrypt.hashSync(password, 10);
  const now = nowIso();

  db.prepare(`
    INSERT INTO users (id, name, email, phone, password_hash, role, specialty, rating, reviews_count, equipment, skills, calendar, subscription, created_at, updated_at)
    VALUES (?, ?, ?, ?, ?, 'specialist', ?, 0.0, 0, '[]', '[]', '{}', 'Free', ?, ?)
  `).run(id, name, email, phone, hash, specialty, now, now);

  const user = rowToUser(db.prepare('SELECT * FROM users WHERE id = ?').get(id));
  const token = createToken(user.id, user.email, user.role);

  return res.status(201).json({
    token,
    userId: user.id,
    name: user.name,
    email: user.email,
    role: user.role,
    specialty: user.specialty,
    rating: user.rating,
    reviewsCount: user.reviews_count,
    equipment: user.equipment,
    skills: user.skills,
    calendar: user.calendar,
    subscription: user.subscription,
  });
});

// ─── POST /auth/logout ───
router.post('/logout', authMiddleware, (_req, res) => {
  // Stateless JWT — just return OK; client discards token
  return res.json({ message: 'OK' });
});

module.exports = router;