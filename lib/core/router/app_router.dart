import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../data/providers/auth_provider.dart';
import '../../screens/login_screen.dart';
import '../../screens/register_screen.dart';
import '../../screens/main_screen.dart';
import '../../screens/order_details_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final isAuthenticated = authState == AuthState.authenticated;
      final isLoggingIn = state.matchedLocation == '/login' ||
          state.matchedLocation == '/register';

      if (!isAuthenticated && !isLoggingIn) return '/login';
      if (isAuthenticated && isLoggingIn) return '/home';
      return null;
    },
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
          final orderData = state.extra as Map<String, dynamic>?;
          if (orderData == null) {
            return const Scaffold(
              body: Center(child: Text('Order not found')),
            );
          }
          return OrderDetailsScreen(orderData: orderData);
        },
      ),
    ],
  );
});
