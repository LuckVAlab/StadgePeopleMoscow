const express = require('express');
const cors = require('cors');
require('dotenv').config();

const authRoutes = require('./routes/auth');
const profileRoutes = require('./routes/profile');
const ordersRoutes = require('./routes/orders');

const app = express();

// CORS — allow all origins for local development (Flutter web on any port)
app.use(
  cors({
    origin: true,
    credentials: true,
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
    allowedHeaders: ['Content-Type', 'Authorization'],
  }),
);

// Handle CORS preflight explicitly
app.options('*', (_req, res) => {
  res.sendStatus(204);
});

app.use(express.json());

app.use('/v1/auth', authRoutes);
app.use('/v1/profile', profileRoutes);
app.use('/v1/orders', ordersRoutes);

// Health check
app.get('/health', (_req, res) => {
  res.json({ status: 'ok', timestamp: new Date().toISOString() });
});

// 404
app.use((_req, res) => {
  res.status(404).json({ message: 'Не найдено' });
});

// Error handler
app.use((err, _req, res, _next) => {
  console.error(err);
  res.status(500).json({ message: 'Ошибка сервера. Попробуйте позже.' });
});

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`✅ Server running on http://localhost:${port}`);
  console.log(`   API base: http://localhost:${port}/v1`);
});