import 'package:flutter/material.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../shared/components/book_card.dart';
import '../../../favorites/domain/services/favorites_service.dart';
import '../../domain/models/book.dart';
import '../screens/book_detail_screen.dart';

/// Item de listagem que liga o [BookCard] genérico à navegação para
/// a tela de detalhes e ao serviço de favoritos.
class BookListItem extends StatelessWidget {
  final Book book;

  const BookListItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final FavoritesService favoritesService =
        ServiceLocator.instance.favoritesService;

    return AnimatedBuilder(
      animation: favoritesService,
      builder: (context, _) {
        final isFavorite = favoritesService.isFavorite(book.workKey);
        return BookCard(
          book: book,
          isFavorite: isFavorite,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => BookDetailScreen(book: book),
              ),
            );
          },
          onFavoriteToggle: () async {
            await favoritesService.toggleFavorite(book);
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isFavorite
                        ? '"${book.title}" removido dos favoritos.'
                        : '"${book.title}" adicionado aos favoritos.',
                  ),
                  duration: const Duration(seconds: 2),
                ),
              );
            }
          },
        );
      },
    );
  }
}
