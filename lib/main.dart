import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stadge_people_moscow/core/theme/app_theme.dart';
import 'package:stadge_people_moscow/core/router/app_router.dart';
import 'package:stadge_people_moscow/data/services/storage_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize storage before any provider is created
  await StorageService.instance.init();
  runApp(
    const ProviderScope(
      child: StadgePeopleMoscowApp(),
    ),
  );
}

class StadgePeopleMoscowApp extends ConsumerWidget {
  const StadgePeopleMoscowApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'StadgePeopleMoscow',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routerConfig: router,
    );
  }
}
