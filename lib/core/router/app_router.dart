import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../data/providers/auth_provider.dart';
import '../../data/models/order_model.dart';
import '../../screens/login_screen.dart';
import '../../screens/register_screen.dart';
import '../../screens/main_screen.dart';
import '../../screens/order_details_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home',
    // Auth is temporarily disabled — will be re-enabled later
    redirect: (context, state) {
      return null;
    },
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Страница не найдена', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go('/home'),
              child: const Text('На главную'),
            ),
          ],
        ),
      ),
    ),
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: '/order/:id',
        builder: (context, state) {
          final orderId = state.pathParameters['id']!;
          final extra = state.extra;
          OrderModel? order;
          if (extra != null && extra is OrderModel) {
            order = extra;
          }
          return OrderDetailsScreen(orderId: orderId, order: order);
        },
      ),
    ],
  );
});

/// Read auth state from context without causing rebuilds.
AuthStatus _getAuthState(BuildContext context) {
  final container = ProviderScope.containerOf(context, listen: false);
  final authState = container.read(authProvider).value;
  return authState ?? AuthStatus.initial;
}
