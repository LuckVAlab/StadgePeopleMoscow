import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stadge_people_moscow/data/providers/role_provider.dart';
import 'package:stadge_people_moscow/screens/create_order_screen.dart';
import 'package:stadge_people_moscow/screens/feed_screen.dart';
import 'package:stadge_people_moscow/screens/profile_screen.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int _currentIndex = 0;

  void _onOrderCreated() {
    setState(() => _currentIndex = 0);
  }

  @override
  Widget build(BuildContext context) {
    final role = ref.watch(roleProvider);
    final isSpec = role == UserRole.specialist;

    final screens = isSpec
        ? [
            const FeedScreen(),
            const ProfileScreen(),
          ]
        : [
            const FeedScreen(),
            const ProfileScreen(),
            CreateOrderScreen(onOrderCreated: _onOrderCreated),
          ];

    final navItems = isSpec
        ? const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Лента'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Профиль'),
          ]
        : const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Лента'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Профиль'),
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
        items: navItems,
      ),
    );
  }
}
