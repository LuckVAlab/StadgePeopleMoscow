const { Router } = require('express');
const { db, rowToUser, nowIso } = require('../db');
const { authMiddleware } = require('../middleware/auth');

const router = Router();

// ─── GET /profile ───
router.get('/', authMiddleware, (req, res) => {
  const user = req.user;
  return res.json({
    token: req.headers.authorization.slice(7),
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

// ─── PUT /profile ───
router.put('/', authMiddleware, (req, res) => {
  const user = req.user;
  const { name, specialty, equipment, skills, calendar, subscription } = req.body;

  const updates = {};
  if (name !== undefined) updates.name = name;
  if (specialty !== undefined) updates.specialty = specialty;
  if (equipment !== undefined) updates.equipment = JSON.stringify(equipment);
  if (skills !== undefined) updates.skills = JSON.stringify(skills);
  if (calendar !== undefined) updates.calendar = JSON.stringify(calendar);
  if (subscription !== undefined) updates.subscription = subscription;

  if (Object.keys(updates).length === 0) {
    return res.status(400).json({ message: 'Нет данных для обновления' });
  }

  updates.updated_at = nowIso();

  const setClause = Object.keys(updates).map((k) => `${k} = ?`).join(', ');
  const values = Object.values(updates);

  db.prepare(`UPDATE users SET ${setClause} WHERE id = ?`).run(...values, user.id);

  const updated = rowToUser(db.prepare('SELECT * FROM users WHERE id = ?').get(user.id));

  return res.json({
    token: req.headers.authorization.slice(7),
    userId: updated.id,
    name: updated.name,
    email: updated.email,
    role: updated.role,
    specialty: updated.specialty,
    rating: updated.rating,
    reviewsCount: updated.reviews_count,
    equipment: updated.equipment,
    skills: updated.skills,
    calendar: updated.calendar,
    subscription: updated.subscription,
  });
});

module.exports = router;