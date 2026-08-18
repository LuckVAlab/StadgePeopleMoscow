import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stadge_people_moscow/main.dart';
import 'package:stadge_people_moscow/screens/main_screen.dart';
import 'package:stadge_people_moscow/data/models/order_model.dart';
import 'package:stadge_people_moscow/data/providers/auth_provider.dart';
import 'package:stadge_people_moscow/data/providers/orders_provider.dart';
import 'package:stadge_people_moscow/data/services/auth_service.dart';
import 'package:stadge_people_moscow/data/services/order_service.dart';
import 'package:stadge_people_moscow/data/services/storage_service.dart';
import 'package:stadge_people_moscow/data/models/auth_model.dart';

// ─── Mock AuthService ───

class _MockAuthService extends AuthService {
  @override
  Future<AuthResponse> login(LoginRequest request) async {
    // Имитируем задержку сети, чтобы состояние loading успело отрисоваться.
    await Future.delayed(const Duration(milliseconds: 100));
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

// ─── Mock OrderService ───

class _MockOrderService extends OrderService {
  @override
  Future<List<OrderModel>> getOrders({String? category}) async {
    return [
      const OrderModel(
        id: 'order_001',
        title: 'FOH-инженер, фестиваль',
        description: 'Работа на фестивале',
        category: 'Звукорежиссёр',
        price: '25 000 ₽',
        priceCents: 2500000,
        date: '15 авг',
        location: 'Москва',
        time: '12:00–02:00',
        clientId: 'client_001',
        clientName: 'EventPro LLC',
        clientPhone: '+7 (999) 123-45-67',
        status: 'open',
      ),
    ];
  }
}

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await StorageService.instance.init();
  });

  Widget buildApp({bool mockOrders = true}) {
    return ProviderScope(
      overrides: [
        authServiceProvider.overrideWith((ref) => _MockAuthService()),
        if (mockOrders)
          orderServiceProvider.overrideWith((ref) => _MockOrderService()),
      ],
      child: const StadgePeopleMoscowApp(),
    );
  }

  // ─── App Launch Tests ───

  testWidgets('App launches and shows main screen with feed',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      buildApp(),
    );
    await tester.pumpAndSettle();

    expect(find.byType(MainScreen), findsOneWidget);
    expect(find.text('Заказы'), findsOneWidget);
  });

  // ─── Login Screen Tests ───

  testWidgets('Login screen renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      buildApp(),
    );

    // Navigate to login
    final context = tester.element(find.byType(MainScreen));
    GoRouter.of(context).go('/login');
    await tester.pumpAndSettle();

    expect(find.text('Вход в аккаунт'), findsOneWidget);
    expect(find.text('Введите ваши данные для входа'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.text('Вход'), findsOneWidget);
    expect(find.text('Зарегистрируйтесь'), findsOneWidget);
  });

  testWidgets('Login screen validates empty email',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      buildApp(),
    );

    final context = tester.element(find.byType(MainScreen));
    GoRouter.of(context).go('/login');
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).at(1), 'password123');
    await tester.tap(find.text('Вход'));
    await tester.pump();

    expect(find.text('Введите email'), findsOneWidget);
  });

  testWidgets('Login screen validates empty password',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      buildApp(),
    );

    final context = tester.element(find.byType(MainScreen));
    GoRouter.of(context).go('/login');
    await tester.pumpAndSettle();

    await tester.enterText(
        find.byType(TextFormField).at(0), 'test@example.com');
    await tester.tap(find.text('Вход'));
    await tester.pump();

    // Check that the password field has an error (at least one Text widget
    // with the error text, excluding the hintText).
    final passwordField = find.byType(TextFormField).at(1);
    expect(
      find.descendant(
        of: passwordField,
        matching: find.text('Введите пароль'),
      ),
      findsOneWidget,
    );
  });

  testWidgets('Login screen shows loading on submit',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      buildApp(),
    );

    // Navigate to login
    final context = tester.element(find.byType(MainScreen));
    GoRouter.of(context).go('/login');
    await tester.pumpAndSettle();

    await tester.enterText(
        find.byType(TextFormField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextFormField).at(1), 'password123');
    await tester.tap(find.text('Вход'));
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Доводим мок-задержку до конца, чтобы не осталось pending-таймеров.
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pumpAndSettle();
  });

  // ─── Register Screen Tests ───

  testWidgets('Register screen renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      buildApp(),
    );

    final context = tester.element(find.byType(MainScreen));
    GoRouter.of(context).go('/register');
    await tester.pumpAndSettle();

    expect(find.text('Регистрация'), findsOneWidget);
    expect(find.text('Войдите'), findsOneWidget);
  });

  testWidgets('Register screen validates empty name',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      buildApp(),
    );

    final context = tester.element(find.byType(MainScreen));
    GoRouter.of(context).go('/register');
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.text('Зарегистрироваться'));
    await tester.tap(find.text('Зарегистрироваться'));
    await tester.pump();

    expect(find.text('Введите имя'), findsOneWidget);
  });

  // ─── Router Tests ───

  testWidgets('After login user is redirected to main screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      buildApp(),
    );

    // Navigate to login
    final context = tester.element(find.byType(MainScreen));
    GoRouter.of(context).go('/login');
    await tester.pumpAndSettle();

    // Fill login form
    await tester.enterText(
        find.byType(TextFormField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextFormField).at(1), 'password123');
    await tester.tap(find.text('Вход'));
    await tester.pumpAndSettle();

    expect(find.byType(MainScreen), findsOneWidget);
  });
}
