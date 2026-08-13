// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stadge_people_moscow/main.dart';
import 'package:stadge_people_moscow/screens/login_screen.dart';
import 'package:stadge_people_moscow/screens/register_screen.dart';
import 'package:stadge_people_moscow/screens/main_screen.dart';
import 'package:stadge_people_moscow/data/providers/auth_provider.dart';
import 'package:stadge_people_moscow/data/services/auth_service.dart';
import 'package:stadge_people_moscow/data/models/auth_model.dart';

void main() {
  // ─── Login Screen Tests ───

  testWidgets('Login screen renders correctly',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const ProviderScope(child: StadgePeopleMoscowApp()),
        );

        expect(find.text('Вход в аккаунт'), findsOneWidget);
        expect(find.text('Введите ваши данные для входа'), findsOneWidget);
        expect(find.byType(TextFormField), findsNWidgets(2));
        expect(find.text('Вход'), findsOneWidget);
        expect(find.text('Зарегистрируйтесь'), findsOneWidget);
      });

  testWidgets('Login screen shows loading on submit',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              authServiceProvider.overrideWith((ref) => _MockAuthService()),
            ],
            child: const StadgePeopleMoscowApp(),
          ),
        );

        // Fill in the form
        await tester.enterText(
            find.byType(TextFormField).at(0), 'test@example.com');
        await tester.enterText(
            find.byType(TextFormField).at(1), 'password123');
        await tester.tap(find.text('Вход'));
        await tester.pump();

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

  testWidgets('Login screen validates empty email',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const ProviderScope(child: StadgePeopleMoscowApp()),
        );

        await tester.enterText(
            find.byType(TextFormField).at(1), 'password123');
        await tester.tap(find.text('Вход'));
        await tester.pump();

        expect(
            find.text('Введите email'), findsOneWidget);
      });

  testWidgets('Login screen validates empty password',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const ProviderScope(child: StadgePeopleMoscowApp()),
        );

        await tester.enterText(
            find.byType(TextFormField).at(0), 'test@example.com');
        await tester.tap(find.text('Вход'));
        await tester.pump();

        expect(
            find.text('Введите пароль'), findsOneWidget);
      });

  // ─── Register Screen Tests ───

  testWidgets('Register screen renders correctly',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const ProviderScope(child: StadgePeopleMoscowApp()),
        );

        await tester.tap(find.text('Зарегистрируйтесь'));
        await tester.pumpAndSettle();

        expect(find.text('Регистрация'), findsOneWidget);
        expect(find.text('Войдите'), findsOneWidget);
      });

  testWidgets('Register screen validates empty name',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const ProviderScope(child: StadgePeopleMoscowApp()),
        );

        await tester.tap(find.text('Зарегистрируйтесь'));
        await tester.pumpAndSettle();

        await tester.tap(find.text('Зарегистрироваться'));
        await tester.pump();

        expect(find.text('Введите имя'), findsOneWidget);
      });

  // ─── Router Tests ───

  testWidgets('Router redirects unauthenticated user to login',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              authServiceProvider.overrideWith((ref) => _MockAuthService()),
            ],
            child: const StadgePeopleMoscowApp(),
          ),
        );

        expect(find.byType(LoginScreen), findsOneWidget);
        expect(find.byType(MainScreen), findsNothing);
      });

  testWidgets('After login user is redirected to main screen',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              authServiceProvider.overrideWith((ref) => _MockAuthService()),
            ],
            child: const StadgePeopleMoscowApp(),
          ),
        );

        // Fill login form
        await tester.enterText(
            find.byType(TextFormField).at(0), 'test@example.com');
        await tester.enterText(
            find.byType(TextFormField).at(1), 'password123');
        await tester.tap(find.text('Вход'));
        await tester.pumpAndSettle();

        expect(find.byType(MainScreen), findsOneWidget);
      });

  // ─── Mock AuthService ───

  class _MockAuthService extends AuthService {
    @override
    Future<AuthResponse> login(LoginRequest request) async {
      return AuthResponse(
        token: 'mock_token',
        userId: 'user_001',
        name: 'Test User',
        email: request.email,
        role: 'specialist',
      );
    }

    @override
    Future<AuthResponse> register(RegisterRequest request) async {
      return AuthResponse(
        token: 'mock_token',
        userId: 'user_002',
        name: request.name,
        email: request.email,
        role: 'specialist',
      );
    }

    @override
    Future<void> logout() async {}

    @override
    Future<void> init() async {}

    @override
    String? restoreToken() => null;
  }
}
