import 'package:flutter/material.dart';
import 'feed_screen.dart';
import 'profile_screen.dart';
import 'create_order_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  String _role = 'spec';

  void _onRoleChanged(String role) {
    setState(() {
      _role = role;
      if (_role == 'spec' && _currentIndex == 2) {
        _currentIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isSpec = _role == 'spec';

    final screens = isSpec
        ? [
            FeedScreen(role: _role, onRoleChanged: _onRoleChanged),
            const ProfileScreen(),
          ]
        : [
            FeedScreen(role: _role, onRoleChanged: _onRoleChanged),
            const ProfileScreen(),
            const CreateOrderScreen(),
          ];

    final navItems = isSpec
        ? const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Лента'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Профиль'),
          ]
        : const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Лента'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Профиль'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Создать'),
          ];

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex < screens.length ? _currentIndex : 0,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex < screens.length ? _currentIndex : 0,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: const Color(0xFF0A0A0A),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        type: BottomNavigationBarType.fixed,
        items: navItems,
      ),
    );
  }
}