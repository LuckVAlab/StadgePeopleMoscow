import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stadge_people_moscow/core/constants/app_constants.dart';
import 'package:stadge_people_moscow/core/theme/app_theme.dart';
import 'package:stadge_people_moscow/core/utils/api_error_handler.dart';
import 'package:stadge_people_moscow/data/models/order_model.dart';
import 'package:stadge_people_moscow/data/providers/orders_provider.dart';
import 'package:stadge_people_moscow/widgets/app_dropdown.dart';
import 'package:stadge_people_moscow/widgets/app_tag.dart';
import 'package:stadge_people_moscow/widgets/app_text_field.dart';

class CreateOrderScreen extends ConsumerStatefulWidget {
  final VoidCallback? onOrderCreated;

  const CreateOrderScreen({super.key, this.onOrderCreated});

  @override
  ConsumerState<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends ConsumerState<CreateOrderScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _priceController;
  late final TextEditingController _locationController;
  late final TextEditingController _timeController;
  late final TextEditingController _tagController;

  String _selectedCategory = AppConstants.orderCategories.first;
  final List<String> _tags = [];
  DateTime? _selectedDate;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();
    _locationController = TextEditingController();
    _timeController = TextEditingController();
    _tagController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _locationController.dispose();
    _timeController.dispose();
    _tagController.dispose();
    super.dispose();
  }

  void _addTag() {
    if (_tagController.text.isNotEmpty && !_tags.contains(_tagController.text)) {
      setState(() {
        _tags.add(_tagController.text);
        _tagController.clear();
      });
    }
  }

  void _removeTag(int index) {
    setState(() => _tags.removeAt(index));
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  int? _parsePrice(String raw) {
    final cleaned = raw.replaceAll(RegExp(r'[^0-9]'), '');
    if (cleaned.isEmpty) return null;
    final value = int.tryParse(cleaned);
    // Price must be non-negative and within reasonable bounds (10M rubles)
    if (value == null || value < 0 || value > 1000000000) return null;
    return value;
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    final priceCents = _parsePrice(_priceController.text);
    if (priceCents == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Введите корректную сумму бюджета')),
        );
      }
      return;
    }

    setState(() => _isLoading = true);

    final newOrder = OrderModel(
      id: 'temp_${DateTime.now().millisecondsSinceEpoch}',
      title: _titleController.text,
      description: _descriptionController.text,
      category: _selectedCategory,
      price: '${_priceController.text} ₽',
      priceCents: priceCents,
      date: _selectedDate != null
          ? '${_selectedDate!.day} ${_getMonthName(_selectedDate!.month)}'
          : 'Не указана',
      orderDate: _selectedDate,
      location: _locationController.text,
      time: _timeController.text,
      tags: _tags.map((t) => OrderTagModel(text: t)).toList(),
      clientId: 'current_user',
      clientName: 'Вы (новый заказчик)',
      clientPhone: 'Не указан',
    );

    try {
      await ref.read(ordersProvider.notifier).addOrder(newOrder);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Заказ создан успешно!')),
        );
      }

      widget.onOrderCreated?.call();

      _titleController.clear();
      _descriptionController.clear();
      _priceController.clear();
      _locationController.clear();
      _timeController.clear();
      _tagController.clear();
      setState(() {
        _tags.clear();
        _selectedDate = null;
        _selectedCategory = AppConstants.orderCategories.first;
      });
    } catch (e) {
      if (mounted) {
        final message = e is ApiErrorInfo ? e.message : 'Ошибка создания заказа';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Создать заказ'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField(
                controller: _titleController,
                label: 'Название заказа',
                hintText: 'FOH-инженер, фестиваль',
                validator: (value) =>
                    value == null || value.isEmpty ? 'Введите название заказа' : null,
              ),
              const SizedBox(height: 24),
              AppTextField(
                controller: _descriptionController,
                label: 'Описание',
                hintText: 'Описание работ...',
                minLines: 4,
                maxLines: 6,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Введите описание' : null,
              ),
              const SizedBox(height: 24),
              AppDropdown<String>(
                label: 'Категория',
                value: _selectedCategory,
                items: AppConstants.orderCategories,
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _selectedCategory = value);
                  }
                },
              ),
              const SizedBox(height: 24),
              AppTextField(
                controller: _priceController,
                label: 'Бюджет (₽)',
                hintText: '25 000',
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Введите бюджет' : null,
              ),
              const SizedBox(height: 24),
              _buildLabel('Дата'),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _selectDate,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppTheme.textMuted),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today,
                          size: 18, color: AppTheme.textMuted),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _selectedDate != null
                              ? '${_selectedDate!.day} ${_getMonthName(_selectedDate!.month)}'
                              : 'Выберите дату',
                          style: TextStyle(
                            color: _selectedDate != null
                                ? AppTheme.textSecondary
                                : AppTheme.textMuted,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              AppTextField(
                controller: _locationController,
                label: 'Местоположение',
                hintText: 'Москва',
                validator: (value) =>
                    value == null || value.isEmpty ? 'Введите местоположение' : null,
              ),
              const SizedBox(height: 24),
              AppTextField(
                controller: _timeController,
                label: 'Время (часы или дни)',
                hintText: '12:00–02:00 или 3 дня',
                validator: (value) =>
                    value == null || value.isEmpty ? 'Введите время' : null,
              ),
              const SizedBox(height: 24),
              _buildLabel('Требования / Теги'),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      controller: _tagController,
                      hintText: 'Напр: DiGiCo SD5',
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: _addTag,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppTheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              if (_tags.isNotEmpty)
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _tags.asMap().entries.map((entry) {
                    return AppTag(
                      text: entry.value,
                      style: TagStyle.normal,
                      onRemove: () => _removeTag(entry.key),
                    );
                  }).toList(),
                ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submitForm,
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text('Создать заказ'),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppTheme.textPrimary,
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      'янв', 'фев', 'мар', 'апр', 'май', 'июн',
      'июл', 'авг', 'сен', 'окт', 'ноя', 'дек'
    ];
    return months[month - 1];
  }
}
