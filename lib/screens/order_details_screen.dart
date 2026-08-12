import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> orderData;

  const OrderDetailsScreen({
    super.key,
    required this.orderData,
  });

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  bool _hasResponded = false;

  void _respondToOrder() {
    setState(() {
      _hasResponded = !_hasResponded;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _hasResponded ? 'Вы откликнулись на заказ' : 'Откклик отменен',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0A0A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Детали заказа'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Хедер
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: const Color(0xFF1C1C1E),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.orderData['title'] ?? 'Без названия',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          widget.orderData['category'] ?? 'Категория',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        widget.orderData['price'] ?? '0 ₽',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Информация
                  _buildInfoSection('Основная информация', [
                    ('Дата', widget.orderData['date'] ?? 'Не указана'),
                    ('Место', widget.orderData['location'] ?? 'Не указано'),
                    ('Время', widget.orderData['time'] ?? 'Не указано'),
                  ]),
                  const SizedBox(height: 24),

                  // Описание
                  const Text(
                    'Описание',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.orderData['description'] ?? 'Описание отсутствует',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Теги/Требования
                  if (widget.orderData['tags'] != null && (widget.orderData['tags'] as List).isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Требования',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: (widget.orderData['tags'] as List)
                              .map((tag) {
                                bool isUrgent = tag is Map && tag['urgent'] == true;
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isUrgent
                                        ? Colors.red.withOpacity(0.15)
                                        : Colors.white.withOpacity(0.05),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: isUrgent
                                          ? Colors.red.withOpacity(0.3)
                                          : Colors.white24,
                                    ),
                                  ),
                                  child: Text(
                                    tag is Map ? tag['text'] ?? '' : tag.toString(),
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: isUrgent ? Colors.red : Colors.white70,
                                    ),
                                  ),
                                );
                              })
                              .toList(),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),

                  // Информация о заказчике
                  _buildInfoSection('О заказчике', [
                    ('Имя', widget.orderData['clientName'] ?? 'Не указано'),
                    ('Телефон', widget.orderData['clientPhone'] ?? 'Не указан'),
                    (
                      'Рейтинг',
                      widget.orderData['clientRating'] != null
                          ? '${widget.orderData['clientRating']} ⭐'
                          : 'Новый'
                    ),
                  ]),
                  const SizedBox(height: 32),

                  // Кнопка отклика
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _respondToOrder,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _hasResponded
                            ? Colors.green.withOpacity(0.2)
                            : Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: _hasResponded ? Colors.green : Colors.transparent,
                          ),
                        ),
                      ),
                      child: Text(
                        _hasResponded ? '✓ Вы откликнулись' : 'Откликнуться',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: _hasResponded ? Colors.green : Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Кнопка отмены
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white24),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Закрыть',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(
    String title,
    List<(String, String)> items,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF1C1C1E),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.$1,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white54,
                          ),
                        ),
                        Text(
                          item.$2,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
