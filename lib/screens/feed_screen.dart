import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../core/theme/app_theme.dart';
import '../data/providers/role_provider.dart';
import '../data/providers/orders_provider.dart';
import '../data/models/order_model.dart';
import '../widgets/app_card.dart';
import '../widgets/app_tag.dart';

class FeedScreen extends ConsumerStatefulWidget {
  const FeedScreen({super.key});

  @override
  ConsumerState<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends ConsumerState<FeedScreen> {
  String _activeFilter = 'Все';
  final List<String> _filters = ['Все', 'Звукорежиссёр', 'Бэклайнер', 'Техник'];

  @override
  void initState() {
    super.initState();
    // Initial load — no category filter
    ref.read(ordersProvider.notifier).loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    final role = ref.watch(roleProvider);
    final ordersAsync = ref.watch(ordersProvider);
    final isSpec = role == UserRole.specialist;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Заказы'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Role switcher
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  Expanded(
                    child: _RoleButton(
                      text: 'Я специалист',
                      isActive: isSpec,
                      onTap: () => ref.read(roleProvider.notifier).state =
                          UserRole.specialist,
                    ),
                  ),
                  Expanded(
                    child: _RoleButton(
                      text: 'Я заказчик',
                      isActive: !isSpec,
                      onTap: () => ref.read(roleProvider.notifier).state =
                          UserRole.client,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Filters
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: _filters.map((filter) {
                final isActive = _activeFilter == filter;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(filter),
                    selected: isActive,
                    onSelected: (_) async {
                      setState(() => _activeFilter = filter);
                      // Server-side category filter
                      final category = filter == 'Все' ? null : filter;
                      await ref
                          .read(ordersProvider.notifier)
                          .loadOrders(category: category);
                    },
                    selectedColor: Colors.white,
                    labelStyle: TextStyle(
                      color: isActive ? Colors.black : Colors.white70,
                      fontSize: 13,
                    ),
                    backgroundColor: AppTheme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isActive ? Colors.white : AppTheme.border,
                      ),
                    ),
                    showCheckmark: false,
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 8),
          // Order list
          Expanded(
            child: ordersAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(
                child: Text('Ошибка: $err',
                    style: const TextStyle(color: AppTheme.error)),
              ),
              data: (orders) {
                if (orders.isEmpty) {
                  return const Center(
                    child: Text(
                      'Нет заказов в этой категории',
                      style: TextStyle(color: AppTheme.textDisabled),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    return _OrderCard(order: orders[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _RoleButton extends StatelessWidget {
  final String text;
  final bool isActive;
  final VoidCallback onTap;

  const _RoleButton({
    required this.text,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isActive ? Colors.black : Colors.white70,
          ),
        ),
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final OrderModel order;

  const _OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: () => context.push('/order/${order.id}', extra: order),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  order.title,
                  style: AppTheme.subtitle,
                ),
              ),
              Text(
                order.price,
                style: AppTheme.subtitle,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _MetaItem(icon: Icons.calendar_today, text: order.date),
              const SizedBox(width: 12),
              _MetaItem(icon: Icons.location_on_outlined, text: order.location),
              const SizedBox(width: 12),
              _MetaItem(icon: Icons.access_time, text: order.time),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 6,
            children: order.tags.map((tag) {
              final style = tag.isUrgent
                  ? TagStyle.urgent
                  : tag.isGreen
                      ? TagStyle.success
                      : TagStyle.normal;
              return AppTag(text: tag.text, style: style);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _MetaItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _MetaItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: AppTheme.textMuted),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(fontSize: 13, color: AppTheme.textMuted),
        ),
      ],
    );
  }
}
