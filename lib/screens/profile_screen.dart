import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final List<String> gearList = const [
    'DiGiCo SD10',
    'Yamaha QL5',
    'Sennheiser IEM',
    'L-Acoustics Kara',
    'Shure Axient',
  ];

  // Даты: номер → статус (null=обычный, true=свободен, false=занят)
  final Map<int, bool?> calendar = const {
    13: false,
    14: false,
    16: true,
    19: false,
    20: false,
    21: false,
    23: true,
    26: false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0A0A),
        elevation: 0,
        title: const Text(
          'Профиль',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Аватар
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFF2C2C2E),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person,
                size: 40,
                color: Colors.white38,
              ),
            ),
            const SizedBox(height: 12),
            // Имя
            const Text(
              'Алексей Петров',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            // Специальность
            const Text(
              'Звукорежиссёр • FOH / Мониторы',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white54,
              ),
            ),
            const SizedBox(height: 8),
            // Рейтинг
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    5,
                    (i) => const Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.amber,
                        )),
                const SizedBox(width: 6),
                const Text(
                  '4.9',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 4),
                const Text(
                  '(23 отзыва)',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Gear List
            _buildSectionTitle('Моё оборудование'),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 3,
              ),
              itemCount: gearList.length + 1,
              itemBuilder: (context, index) {
                if (index == gearList.length) {
                  return _GearChip(
                    text: 'Добавить...',
                    isAdd: true,
                    onTap: () {},
                  );
                }
                return _GearChip(text: gearList[index]);
              },
            ),
            const SizedBox(height: 24),
            // Календарь
            _buildSectionTitle('Календарь занятости'),
            const SizedBox(height: 12),
            _buildCalendar(),
            const SizedBox(height: 12),
            // Легенда
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _LegendItem(color: Colors.green, label: 'Свободен'),
                const SizedBox(width: 16),
                _LegendItem(color: Colors.red, label: 'Занят'),
              ],
            ),
            const SizedBox(height: 24),
            // Подписка
            _buildSectionTitle('Подписка'),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1C1C1E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'EventOS Pro — до 15 сентября',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    final days = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
    final dates = List.generate(20, (i) => i + 12); // 12-31

    return Column(
      children: [
        // Дни недели
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: days
              .map((d) => SizedBox(
                    width: 36,
                    child: Text(
                      d,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white38,
                      ),
                    ),
                  ))
              .toList(),
        ),
        const SizedBox(height: 8),
        // Даты
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: dates.map((date) {
            final status = calendar[date];
            Color bgColor = const Color(0xFF1C1C1E);
            Color textColor = Colors.white70;

            if (status == true) {
              bgColor = Colors.green.withOpacity(0.15);
              textColor = Colors.green;
            } else if (status == false) {
              bgColor = Colors.red.withOpacity(0.15);
              textColor = Colors.red;
            }

            return Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                '$date',
                style: TextStyle(
                  fontSize: 13,
                  color: textColor,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _GearChip extends StatelessWidget {
  final String text;
  final bool isAdd;
  final VoidCallback? onTap;

  const _GearChip({
    required this.text,
    this.isAdd = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1E),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isAdd ? Colors.white24 : Colors.transparent,
          ),
        ),
        alignment: Alignment.center,
        child: isAdd
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add, size: 16, color: Colors.white54),
                  const SizedBox(width: 4),
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white54,
                    ),
                  ),
                ],
              )
            : Text(
                text,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.white54),
        ),
      ],
    );
  }
}
