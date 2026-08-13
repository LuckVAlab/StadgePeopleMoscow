import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/theme/app_theme.dart';
import '../widgets/app_tag.dart';
import '../widgets/app_card.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool _isEditMode = false;

  late final TextEditingController _nameController;
  late final TextEditingController _specialtyController;

  final List<String> _gearList = [
    'DiGiCo SD10',
    'Yamaha QL5',
    'Sennheiser IEM',
    'L-Acoustics Kara',
    'Shure Axient',
  ];

  final List<String> _skillsList = [
    'Звуковой баланс',
    'Работа с мониторами',
    'Миксирование вживую',
    'Работа с DiGiCo',
  ];

  String _userName = 'Алексей Петров';
  String _userSpecialty = 'Звукорежиссёр • FOH / Мониторы';

  // day number -> status (null=normal, true=available, false=busy)
  final Map<int, bool?> _calendar = const {
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
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: _userName);
    _specialtyController = TextEditingController(text: _userSpecialty);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _specialtyController.dispose();
    super.dispose();
  }

  void _addGear(String gear) {
    if (gear.isNotEmpty && !_gearList.contains(gear)) {
      setState(() => _gearList.add(gear));
    }
  }

  void _removeGear(String gear) {
    setState(() => _gearList.remove(gear));
  }

  void _addSkill(String skill) {
    if (skill.isNotEmpty && !_skillsList.contains(skill)) {
      setState(() => _skillsList.add(skill));
    }
  }

  void _removeSkill(String skill) {
    setState(() => _skillsList.remove(skill));
  }

  void _showAddDialog(String title, String hint, void Function(String) onAdd) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: TextField(
          controller: controller,
          style: const TextStyle(color: AppTheme.textPrimary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: AppTheme.textMuted),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () {
              onAdd(controller.text);
              Navigator.pop(ctx);
            },
            child: const Text('Добавить'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  if (_isEditMode) {
                    setState(() {
                      _userName = _nameController.text;
                      _userSpecialty = _specialtyController.text;
                      _isEditMode = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Профиль обновлен')),
                    );
                  } else {
                    setState(() => _isEditMode = true);
                  }
                },
                child: Text(
                  _isEditMode ? 'Готово' : 'Редакт.',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Avatar
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: AppTheme.surfaceLight,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person,
                size: 40,
                color: AppTheme.textDisabled,
              ),
            ),
            const SizedBox(height: 12),
            // Name
            if (!_isEditMode)
              Text(_userName,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500))
            else
              TextField(
                controller: _nameController,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textPrimary,
                ),
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                ),
              ),
            const SizedBox(height: 4),
            // Specialty
            if (!_isEditMode)
              Text(_userSpecialty, style: AppTheme.caption)
            else
              TextField(
                controller: _specialtyController,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppTheme.textSecondary,
                ),
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                ),
              ),
            const SizedBox(height: 8),
            // Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  5,
                  (_) => const Icon(Icons.star,
                      size: 16, color: AppTheme.warning),
                ),
                const SizedBox(width: 6),
                const Text('4.9',
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500)),
                const SizedBox(width: 4),
                const Text('(23 отзыва)', style: AppTheme.caption),
              ],
            ),
            const SizedBox(height: 24),
            // Gear
            _buildSectionTitle('Моё оборудование'),
            const SizedBox(height: 12),
            AppCard(
              margin: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_gearList.isEmpty)
                    const Text('Оборудование не добавлено',
                        style: AppTheme.body)
                  else
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _gearList.map((gear) {
                        return AppTag(
                          text: gear,
                          style: TagStyle.normal,
                          onRemove: () => _removeGear(gear),
                        );
                      }).toList(),
                    ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () => _showAddDialog(
                      'Добавить оборудование',
                      'Название оборудования',
                      _addGear,
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppTheme.textMuted),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, size: 18, color: AppTheme.textMuted),
                          SizedBox(width: 4),
                          Text('Добавить оборудование',
                              style: AppTheme.caption),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Skills
            _buildSectionTitle('Мои скилы'),
            const SizedBox(height: 12),
            AppCard(
              margin: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_skillsList.isEmpty)
                    const Text('Скилы не добавлены', style: AppTheme.body)
                  else
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _skillsList.map((skill) {
                        return AppTag(
                          text: skill,
                          style: TagStyle.success,
                          onRemove: () => _removeSkill(skill),
                        );
                      }).toList(),
                    ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () => _showAddDialog(
                      'Добавить скил',
                      'Название скила',
                      _addSkill,
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppTheme.textMuted),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, size: 18, color: AppTheme.textMuted),
                          SizedBox(width: 4),
                          Text('Добавить скил', style: AppTheme.caption),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Calendar
            _buildSectionTitle('Календарь занятости'),
            const SizedBox(height: 12),
            _buildCalendar(),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _LegendItem(color: AppTheme.success, label: 'Свободен'),
                SizedBox(width: 16),
                _LegendItem(color: AppTheme.error, label: 'Занят'),
              ],
            ),
            const SizedBox(height: 24),
            // Subscription
            _buildSectionTitle('Подписка'),
            const SizedBox(height: 12),
            const AppCard(
              margin: EdgeInsets.zero,
              child: Text(
                'EventOS Pro — до 15 сентября',
                style: AppTheme.body,
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
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildCalendar() {
    final days = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
    final currentDate = DateTime.now();
    final firstDayOfMonth = DateTime(currentDate.year, currentDate.month, 1);
    final lastDayOfMonth = DateTime(currentDate.year, currentDate.month + 1, 0);

    final firstWeekday = firstDayOfMonth.weekday - 1;
    final daysInMonth = lastDayOfMonth.day;

    final calendarDays = <int?>[];
    for (int i = 0; i < firstWeekday; i++) {
      calendarDays.add(null);
    }
    for (int i = 1; i <= daysInMonth; i++) {
      calendarDays.add(i);
    }

    return Column(
      children: [
        Text(
          '${_getMonthName(currentDate.month)} ${currentDate.year}',
          style: AppTheme.caption,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: days
              .map((d) => SizedBox(
                    width: 40,
                    child: Text(
                      d,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.textDisabled,
                      ),
                    ),
                  ))
              .toList(),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1,
          ),
          itemCount: calendarDays.length,
          itemBuilder: (context, index) {
            final day = calendarDays[index];
            if (day == null) return Container();

            final status = _calendar[day];
            final (bgColor, textColor) = switch (status) {
              true => (
                  AppTheme.success.withOpacity(0.15),
                  AppTheme.success,
                ),
              false => (
                  AppTheme.error.withOpacity(0.15),
                  AppTheme.error,
                ),
              null => (
                  AppTheme.surface,
                  AppTheme.textSecondary,
                ),
            };

            return Container(
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                '$day',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  String _getMonthName(int month) {
    const months = [
      'Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь',
      'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'
    ];
    return months[month - 1];
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
        Text(label, style: AppTheme.small),
      ],
    );
  }
}
