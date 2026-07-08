import 'package:flutter/foundation.dart';

import '../../../books/domain/models/book.dart';
import '../repositories/favorites_repository.dart';

/// Serviço de negócio para favoritos. Mantém um cache em memória
/// e notifica ouvintes (telas) quando a lista de favoritos muda,
/// permitindo que a UI reaja sem precisar recarregar manualmente.
class FavoritesService extends ChangeNotifier {
  final FavoritesRepository _repository;

  FavoritesService({required FavoritesRepository repository})
      : _repository = repository;

  final Set<String> _favoriteKeys = {};
  List<Book> _favorites = [];
  bool _initialized = false;

  List<Book> get favorites => List.unmodifiable(_favorites);

  bool isFavorite(String workKey) => _favoriteKeys.contains(workKey);

  /// Carrega os favoritos persistidos. Deve ser chamado ao iniciar o app.
  Future<void> loadFavorites() async {
    _favorites = await _repository.getFavorites();
    _favoriteKeys
      ..clear()
      ..addAll(_favorites.map((b) => b.workKey));
    _initialized = true;
    notifyListeners();
  }

  Future<void> toggleFavorite(Book book) async {
    if (!_initialized) await loadFavorites();

    if (_favoriteKeys.contains(book.workKey)) {
      await _repository.removeFavorite(book.workKey);
      _favoriteKeys.remove(book.workKey);
      _favorites.removeWhere((b) => b.workKey == book.workKey);
    } else {
      await _repository.addFavorite(book);
      _favoriteKeys.add(book.workKey);
      _favorites.insert(0, book);
    }
    notifyListeners();
  }

  Future<void> removeFavorite(String workKey) async {
    await _repository.removeFavorite(workKey);
    _favoriteKeys.remove(workKey);
    _favorites.removeWhere((b) => b.workKey == workKey);
    notifyListeners();
  }
}
