import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stadge_people_moscow/core/theme/app_theme.dart';
import 'package:stadge_people_moscow/core/utils/api_error_handler.dart';
import 'package:stadge_people_moscow/data/models/auth_model.dart';
import 'package:stadge_people_moscow/data/models/order_model.dart';
import 'package:stadge_people_moscow/data/providers/auth_provider.dart';
import 'package:stadge_people_moscow/data/providers/orders_provider.dart';
import 'package:stadge_people_moscow/widgets/app_card.dart';
import 'package:stadge_people_moscow/widgets/app_tag.dart';

class OrderDetailsScreen extends ConsumerStatefulWidget {
  final String orderId;
  final OrderModel? order;

  const OrderDetailsScreen({
    super.key,
    required this.orderId,
    this.order,
  });

  @override
  ConsumerState<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends ConsumerState<OrderDetailsScreen> {
  bool _hasResponded = false;
  bool _isResponding = false;
  late final OrderModel _order;
  late final String _orderId;
  AuthResponse? _currentUser;
  bool _hasData = false;

  @override
  void initState() {
    super.initState();
    _orderId = widget.orderId;
    _currentUser = ref.read(authProvider.notifier).currentUser;
    if (widget.order == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) context.pop();
      });
      return;
    }
    _order = widget.order!;
    _hasData = true;
  }

  @override
  Widget build(BuildContext context) {
    if (!_hasData) {
      return Scaffold(
        appBar: AppBar(title: const Text('Детали заказа')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final authState = ref.watch(authProvider).value;
    final specialistId =
        authState == AuthStatus.authenticated ? _currentUser?.userId : null;

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
                    _order.title,
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
                          color: AppTheme.primary.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          _order.category,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppTheme.primary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        _order.price,
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
                    ('Дата', _order.date),
                    ('Место', _order.location),
                    ('Время', _order.time),
                  ]),
                  const SizedBox(height: 24),

                  const Text('Описание', style: AppTheme.subtitle),
                  const SizedBox(height: 8),
                  Text(
                    _order.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppTheme.textSecondary,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Tags / Requirements
                  if (_order.tags.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Требования', style: AppTheme.subtitle),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: _order.tags.map((tag) {
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
                    ('Имя', _order.clientName),
                    ('Телефон', _order.clientPhone),
                    (
                      'Рейтинг',
                      _order.clientRating != null
                          ? '${_order.clientRating} ⭐'
                          : 'Новый'
                    ),
                  ]),
                  const SizedBox(height: 32),

                  // Response button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isResponding || specialistId == null
                          ? null
                          : _respondToOrder,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _hasResponded
                            ? AppTheme.success.withValues(alpha: 0.2)
                            : AppTheme.primary,
                        side: BorderSide(
                          color: _hasResponded
                              ? AppTheme.success
                              : Colors.transparent,
                        ),
                      ),
                      child: _isResponding
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              _hasResponded
                                  ? '✓ Вы откликнулись'
                                  : 'Откликнуться',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                  if (specialistId == null) ...[
                    const SizedBox(height: 8),
                    const Text(
                      'Войдите, чтобы откликнуться',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppTheme.textMuted,
                      ),
                    ),
                  ],
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

  Future<void> _respondToOrder() async {
    final specialistId = _currentUser?.userId;

    if (specialistId == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Необходимо войти в аккаунт')),
        );
      }
      return;
    }

    setState(() => _isResponding = true);

    try {
      await ref
          .read(ordersProvider.notifier)
          .respondToOrder(_orderId, specialistId);

      setState(() => _hasResponded = true);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Вы откликнулись на заказ')),
        );
      }
    } catch (e) {
      if (mounted) {
        final message = e is ApiErrorInfo ? e.message : 'Ошибка при отклике';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }
    } finally {
      if (mounted) setState(() => _isResponding = false);
    }
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
