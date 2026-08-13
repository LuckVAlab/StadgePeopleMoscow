import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../core/theme/app_theme.dart';
import '../data/models/order_model.dart';
import '../widgets/app_card.dart';
import '../widgets/app_tag.dart';

class OrderDetailsScreen extends ConsumerStatefulWidget {
  final Map<String, dynamic> orderData;

  const OrderDetailsScreen({super.key, required this.orderData});

  @override
  ConsumerState<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends ConsumerState<OrderDetailsScreen> {
  bool _hasResponded = false;

  void _respondToOrder() {
    setState(() => _hasResponded = !_hasResponded);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _hasResponded ? 'Вы откликнулись на заказ' : 'Отклик отменен',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final order = OrderModel.fromJson(widget.orderData);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Детали заказа'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: AppTheme.surface,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.title,
                    style: AppTheme.title,
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
                          color: AppTheme.primary.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          order.category,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppTheme.primary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        order.price,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
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
                  _buildInfoSection('Основная информация', [
                    ('Дата', order.date),
                    ('Место', order.location),
                    ('Время', order.time),
                  ]),
                  const SizedBox(height: 24),

                  const Text('Описание', style: AppTheme.subtitle),
                  const SizedBox(height: 8),
                  Text(
                    order.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppTheme.textSecondary,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Tags / Requirements
                  if (order.tags.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Требования', style: AppTheme.subtitle),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: order.tags.map((tag) {
                            final style = tag.isUrgent
                                ? TagStyle.urgent
                                : TagStyle.normal;
                            return AppTag(
                              text: tag.text,
                              style: style,
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),

                  _buildInfoSection('О заказчике', [
                    ('Имя', order.clientName),
                    ('Телефон', order.clientPhone),
                    (
                      'Рейтинг',
                      order.clientRating != null
                          ? '${order.clientRating} ⭐'
                          : 'Новый'
                    ),
                  ]),
                  const SizedBox(height: 32),

                  // Response button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _respondToOrder,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _hasResponded
                            ? AppTheme.success.withOpacity(0.2)
                            : AppTheme.primary,
                        side: BorderSide(
                          color: _hasResponded
                              ? AppTheme.success
                              : Colors.transparent,
                        ),
                      ),
                      child: Text(
                        _hasResponded ? '✓ Вы откликнулись' : 'Откликнуться',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: _hasResponded ? AppTheme.success : Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => context.pop(),
                      child: const Text('Закрыть'),
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

  Widget _buildInfoSection(String title, List<(String, String)> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTheme.subtitle),
        const SizedBox(height: 12),
        AppCard(
          margin: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item.$1, style: AppTheme.caption),
                        Text(
                          item.$2,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.textSecondary,
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
