import 'package:flutter/material.dart';
import 'order_details_screen.dart';

class FeedScreen extends StatefulWidget {
  final String role;
  final Function(String) onRoleChanged;

  const FeedScreen({
    super.key,
    required this.role,
    required this.onRoleChanged,
  });

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  String _activeFilter = 'Все';
  final List<String> _filters = ['Все', 'Звукорежиссёр', 'Бэклайнер', 'Техник'];

    final List<Map<String, dynamic>> _allOrders = const [
    {
      'title': 'FOH-инженер, фестиваль',
      'category': 'Звукорежиссёр',
      'price': '25 000 ₽',
      'date': '15 авг',
      'location': 'Москва',
      'time': '12:00–02:00',
      'tags': [
        {'text': 'Срочно', 'urgent': true},
        {'text': 'DiGiCo SD5', 'urgent': false},
        {'text': 'Опыт 3+ года', 'urgent': false},
      ],
    },
    {
      'title': 'Бэклайнер, клубный тур',
      'category': 'Бэклайнер',
      'price': '18 000 ₽',
      'date': '20–22 авг',
      'location': 'СПб',
      'time': '3 дня',
      'tags': [
        {'text': 'Fender, Marshall', 'urgent': false},
        {'text': 'Свой сетап', 'urgent': false, 'green': true},
      ],
    },
    {
      'title': 'Monitor-инженер',
      'category': 'Техник',
      'price': '20 000 ₽',
      'date': '18 авг',
      'location': 'Москва',
      'time': '16:00–00:00',
      'tags': [
        {'text': 'Yamaha Rivage', 'urgent': false},
        {'text': 'In-Ear', 'urgent': false},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0A0A),
        elevation: 0,
        title: const Text(
          'Заказы',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Переключатель ролей
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1C1C1E),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  Expanded(
                    child: _RoleButton(
                      text: 'Я специалист',
                      isActive: widget.role == 'spec',
                      onTap: () => widget.onRoleChanged('spec'),
                    ),
                  ),
                  Expanded(
                    child: _RoleButton(
                      text: 'Я заказчик',
                      isActive: widget.role == 'client',
                      onTap: () => widget.onRoleChanged('client'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Фильтры
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
                    onSelected: (_) => setState(() => _activeFilter = filter),
                    selectedColor: Colors.white,
                    labelStyle: TextStyle(
                      color: isActive ? Colors.black : Colors.white70,
                      fontSize: 13,
                    ),
                    backgroundColor: const Color(0xFF1C1C1E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isActive ? Colors.white : const Color(0xFF3A3A3C),
                      ),
                    ),
                    showCheckmark: false,
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 8),
          // Список заказов
                     Expanded(
              child: Builder(
                builder: (context) {
                  final filteredOrders = _activeFilter == 'Все'
                      ? _allOrders
                      : _allOrders.where((o) => o['category'] == _activeFilter).toList();
                  
                  if (filteredOrders.isEmpty) {
                    return const Center(
                      child: Text(
                        'Нет заказов в этой категории',
                        style: TextStyle(color: Colors.white38),
                      ),
                    );
                  }
                  
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredOrders.length,
                    itemBuilder: (context, index) {
                      return _OrderCard(order: filteredOrders[index]);
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
  final Map<String, dynamic> order;

  const _OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetailsScreen(orderData: order),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      order['title'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    order['price'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  _MetaItem(icon: Icons.calendar_today, text: order['date']),
                  const SizedBox(width: 12),
                  _MetaItem(icon: Icons.location_on_outlined, text: order['location']),
                  const SizedBox(width: 12),
                  _MetaItem(icon: Icons.access_time, text: order['time']),
                ],
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 6,
                children: (order['tags'] as List).map((tag) {
                  return Chip(
                    label: Text(
                      tag['text'],
                      style: TextStyle(
                        fontSize: 12,
                        color: tag['urgent'] == true
                            ? Colors.red
                            : tag['green'] == true
                                ? Colors.green
                                : Colors.white70,
                      ),
                    ),
                    backgroundColor: tag['urgent'] == true
                        ? Colors.red.withOpacity(0.15)
                        : tag['green'] == true
                            ? Colors.green.withOpacity(0.15)
                            : const Color(0xFF2C2C2E),
                    side: BorderSide.none,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
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
        Icon(icon, size: 14, color: Colors.white54),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(fontSize: 13, color: Colors.white54),
        ),
      ],
    );
  }
}