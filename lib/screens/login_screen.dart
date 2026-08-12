import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitLogin() {
    if (_formKey.currentState!.validate()) {
      // TODO: Отправить на сервер
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Вход выполнен!')),
      );
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Color(0xFF0A0A0A),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Логотип / Заголовок
                const SizedBox(height: 40),
                const Text(
                  'StadgePeople',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'Moscow',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 40),

                // Подзаголовок
                const Text(
                  'Вход в аккаунт',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Введите ваши данные для входа',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white54,
                  ),
                ),
                const SizedBox(height: 40),

                // Форма
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        decoration: InputDecoration(
                          hintText: 'your@email.com',
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
                        ),
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
                      const SizedBox(height: 24),

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
                          hintText: 'Введите пароль',
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
                      const SizedBox(height: 12),

                      // Забыли пароль?
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            // TODO: Навигация к экрану восстановления пароля
                          },
                          child: const Text(
                            'Забыли пароль?',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Кнопка входа
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _submitLogin,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Вход',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Регистрация
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Нет аккаунта? ',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white54,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: const Text(
                              'Зарегистрируйтесь',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
