const jwt = require('jsonwebtoken');
const { db, rowToUser } = require('../db');

function createToken(userId, email, role) {
  return jwt.sign(
    { sub: userId, email, role },
    process.env.JWT_SECRET || 'dev-secret',
    { expiresIn: process.env.JWT_EXPIRES_IN || '7d' },
  );
}

function authMiddleware(req, res, next) {
  const header = req.headers.authorization;
  if (!header || !header.startsWith('Bearer ')) {
    return res.status(401).json({ message: 'Требуется авторизация' });
  }

  const token = header.slice(7);
  try {
    const payload = jwt.verify(token, process.env.JWT_SECRET || 'dev-secret');
    const row = db.prepare('SELECT * FROM users WHERE id = ?').get(payload.sub);
    if (!row) {
      return res.status(401).json({ message: 'Пользователь не найден' });
    }
    req.user = rowToUser(row);
    next();
  } catch {
    return res.status(401).json({ message: 'Сессия истекла. Войдите снова.' });
  }
}

module.exports = { createToken, authMiddleware };