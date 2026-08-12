import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';

void main() {
  runApp(const StadgePeopleMoscowApp());
}

class StadgePeopleMoscowApp extends StatelessWidget {
  const StadgePeopleMoscowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StadgePeopleMoscow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
        colorScheme: const ColorScheme.dark(
          surface: Color(0xFF0A0A0A),
          surfaceContainerHighest: Color(0xFF1C1C1E),
        ),
        cardTheme: CardTheme(
          color: const Color(0xFF1C1C1E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: const LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const MainScreen(),
      },
    );
  }
}
