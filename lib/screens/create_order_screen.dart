import 'package:flutter/material.dart';

class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({super.key});

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Контроллеры для полей
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _locationController;
  late TextEditingController _timeController;
  late TextEditingController _tagController;

  String _selectedCategory = 'Звукорежиссёр';
  List<String> _tags = [];
  DateTime? _selectedDate;

  final List<String> _categories = [
    'Звукорежиссёр',
    'Бэклайнер',
    'Техник',
    'Мониторист',
  ];

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
    if (_tagController.text.isNotEmpty) {
      setState(() {
        _tags.add(_tagController.text);
        _tagController.clear();
      });
    }
  }

  void _removeTag(int index) {
    setState(() {
      _tags.removeAt(index);
    });
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // TODO: Создать заказ и отправить на сервер
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Заказ создан!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0A0A),
        elevation: 0,
        title: const Text(
          'Создать заказ',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Название заказа
              _buildLabel('Название заказа'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _titleController,
                style: const TextStyle(color: Colors.white),
                decoration: _buildInputDecoration('FOH-инженер, фестиваль'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите название заказа';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Описание
              _buildLabel('Описание'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _descriptionController,
                style: const TextStyle(color: Colors.white),
                minLines: 4,
                maxLines: 6,
                decoration: _buildInputDecoration('Описание работ...'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите описание';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Категория
              _buildLabel('Категория'),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1C1E),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white24),
                ),
                child: DropdownButton<String>(
                  value: _selectedCategory,
                  isExpanded: true,
                  underline: const SizedBox(),
                  dropdownColor: const Color(0xFF2C2C2E),
                  items: _categories.map((cat) {
                    return DropdownMenuItem(
                      value: cat,
                      child: Text(
                        cat,
                        style: const TextStyle(color: Colors.white70),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _selectedCategory = value);
                    }
                  },
                ),
              ),
              const SizedBox(height: 24),

              // Цена
              _buildLabel('Бюджет (₽)'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _priceController,
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                decoration: _buildInputDecoration('25 000'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите бюджет';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Дата
              _buildLabel('Дата'),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _selectDate,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C1C1E),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 18, color: Colors.white54),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _selectedDate != null
                              ? '${_selectedDate!.day} ${_getMonthName(_selectedDate!.month)}'
                              : 'Выберите дату',
                          style: TextStyle(
                            color: _selectedDate != null ? Colors.white70 : Colors.white54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Локация
              _buildLabel('Местоположение'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _locationController,
                style: const TextStyle(color: Colors.white),
                decoration: _buildInputDecoration('Москва'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите местоположение';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Время
              _buildLabel('Время (часы или дни)'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _timeController,
                style: const TextStyle(color: Colors.white),
                decoration: _buildInputDecoration('12:00–02:00 или 3 дня'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите время';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Теги
              _buildLabel('Требования / Теги'),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _tagController,
                      style: const TextStyle(color: Colors.white),
                      decoration: _buildInputDecoration('Напр: DiGiCo SD5'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: _addTag,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue,
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
                    int index = entry.key;
                    String tag = entry.value;
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue.withOpacity(0.3)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            tag,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () => _removeTag(index),
                            child: const Icon(
                              Icons.close,
                              size: 16,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              const SizedBox(height: 32),

              // Кнопка отправки
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Создать заказ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
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
        color: Colors.white,
      ),
    );
  }

  InputDecoration _buildInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.white54),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white24),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
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