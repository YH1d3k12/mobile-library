import '../../../books/domain/models/book.dart';

/// Contrato de acesso a dados de favoritos, independente da origem.
abstract class FavoritesRepository {
  Future<void> addFavorite(Book book);
  Future<void> removeFavorite(String workKey);
  Future<List<Book>> getFavorites();
  Future<bool> isFavorite(String workKey);
}
