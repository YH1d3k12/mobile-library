import 'package:flutter/material.dart';

import '../features/books/presentation/screens/search_screen.dart';
import '../features/favorites/presentation/screens/favorites_screen.dart';

/// Rotas nomeadas do aplicativo. A tela de detalhes não possui rota
/// nomeada fixa pois recebe um [Book] como argumento via construtor,
/// sendo navegada diretamente com [MaterialPageRoute].
class AppRoutes {
  AppRoutes._();

  static const String search = '/';
  static const String favorites = '/favorites';

  static Map<String, WidgetBuilder> get routes => {
        search: (context) => const SearchScreen(),
        favorites: (context) => const FavoritesScreen(),
      };
}
