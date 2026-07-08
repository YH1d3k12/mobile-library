import 'package:flutter/material.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/components/book_card.dart';
import '../../../../shared/widgets/main_app_bar.dart';
import '../../../books/presentation/screens/book_detail_screen.dart';
import '../../domain/services/favorites_service.dart';

/// Tela de favoritos: exibe os livros salvos localmente e permite
/// removê-los da lista.
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesService = ServiceLocator.instance.favoritesService;

    return Scaffold(
      appBar: const MainAppBar(title: 'Favoritos', showBackButton: true),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: favoritesService,
          builder: (context, _) {
            final favorites = favoritesService.favorites;

            if (favorites.isEmpty) {
              return const _EmptyFavorites();
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final book = favorites[index];
                return BookCard(
                  book: book,
                  isFavorite: true,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => BookDetailScreen(book: book),
                      ),
                    );
                  },
                  onFavoriteToggle: () async {
                    await favoritesService.removeFavorite(book.workKey);
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '"${book.title}" removido dos favoritos.',
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _EmptyFavorites extends StatelessWidget {
  const _EmptyFavorites();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.star_border_rounded,
              size: 64,
              color: AppColors.gold,
            ),
            const SizedBox(height: 16),
            Text(
              'Você ainda não tem favoritos',
              textAlign: TextAlign.center,
              style: AppTypography.sectionTitle,
            ),
            const SizedBox(height: 8),
            const Text(
              'Toque na estrela de um livro para guardá-lo aqui.',
              textAlign: TextAlign.center,
              style: AppTypography.bodyMuted,
            ),
          ],
        ),
      ),
    );
  }
}
