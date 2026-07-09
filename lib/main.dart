import 'package:flutter/material.dart';

import 'core/services/service_locator.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_manager.dart'; // <-- Adicione esta importação
import 'routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ServiceLocator.instance.favoritesService.loadFavorites();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Escuta as mudanças de tema em tempo real
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeManager.themeModeNotifier,
      builder: (context, currentMode, _) {
        return MaterialApp(
          title: 'Biblioteca de Alexandria',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: currentMode,
          initialRoute: AppRoutes.search,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}