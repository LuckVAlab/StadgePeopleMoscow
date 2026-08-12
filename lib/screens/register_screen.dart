import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  String _selectedSpecialty = 'Звукорежиссёр';

  final List<String> _specialties = [
    'Звукорежиссёр',
    'Бэклайнер',
    'Техник',
    'Мониторист',
    'Другое',
  ];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitRegister() {
    if (_formKey.currentState!.validate()) {
      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Пароли не совпадают')),
        );
        return;
      }
      // TODO: Отправить на сервер
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Регистрация выполнена!')),
      );
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF0A0A0A),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                // Заголовок
                const Text(
                  'Регистрация',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Создайте аккаунт для начала работы',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white54,
                  ),
                ),
                const SizedBox(height: 32),

                // Форма
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Имя
                      const Text(
                        'Имя',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _nameController,
                        style: const TextStyle(color: Colors.white),
                        decoration: _buildInputDecoration('Ваше имя'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Введите имя';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Email
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _emailController,
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                        decoration: _buildInputDecoration('your@email.com'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Введите email';
                          }
                          if (!value.contains('@')) {
                            return 'Введите корректный email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Телефон
                      const Text(
                        'Телефон',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _phoneController,
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.phone,
                        decoration: _buildInputDecoration('+7 (999) 999-99-99'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Введите телефон';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Специальность
                      const Text(
                        'Специальность',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1C1C1E),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.white24),
                        ),
                        child: DropdownButton<String>(
                          value: _selectedSpecialty,
                          isExpanded: true,
                          underline: const SizedBox(),
                          dropdownColor: const Color(0xFF2C2C2E),
                          items: _specialties.map((spec) {
                            return DropdownMenuItem(
                              value: spec,
                              child: Text(
                                spec,
                                style: const TextStyle(color: Colors.white70),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() => _selectedSpecialty = value);
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Пароль
                      const Text(
                        'Пароль',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordController,
                        style: const TextStyle(color: Colors.white),
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          hintText: 'Минимум 6 символов',
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
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                            child: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white54,
                              size: 20,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Введите пароль';
                          }
                          if (value.length < 6) {
                            return 'Пароль должен быть не менее 6 символов';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Подтверждение пароля
                      const Text(
                        'Подтвердите пароль',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _confirmPasswordController,
                        style: const TextStyle(color: Colors.white),
                        obscureText: _obscureConfirmPassword,
                        decoration: InputDecoration(
                          hintText: 'Повторите пароль',
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
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureConfirmPassword =
                                    !_obscureConfirmPassword;
                              });
                            },
                            child: Icon(
                              _obscureConfirmPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white54,
                              size: 20,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Подтвердите пароль';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),

                      // Кнопка регистрации
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _submitRegister,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Зарегистрироваться',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Вход
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Уже есть аккаунт? ',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white54,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Войдите',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
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
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
    );
  }
}
