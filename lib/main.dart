import 'package:flutter/material.dart';

import 'core/services/service_locator.dart';
import 'core/theme/app_theme.dart';
import 'routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Carrega os favoritos persistidos antes de exibir a UI, garantindo
  // que o estado de favoritos já esteja disponível na primeira tela.
  await ServiceLocator.instance.favoritesService.loadFavorites();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biblioteca de Alexandria',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.search,
      routes: AppRoutes.routes,
    );
  }
}
