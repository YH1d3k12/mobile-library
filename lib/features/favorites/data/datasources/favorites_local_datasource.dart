import '../../../../database/dao/favorite_book_dao.dart';
import '../entities/favorite_book_entity.dart';

/// Fonte de dados local para favoritos, apoiada em SQLite via [FavoriteBookDao].
class FavoritesLocalDataSource {
  final FavoriteBookDao _dao;

  FavoritesLocalDataSource({FavoriteBookDao? dao}) : _dao = dao ?? FavoriteBookDao();

  Future<void> saveFavorite(FavoriteBookEntity entity) => _dao.insert(entity);

  Future<void> removeFavorite(String workKey) => _dao.deleteByWorkKey(workKey);

  Future<List<FavoriteBookEntity>> getAllFavorites() => _dao.getAll();

  Future<bool> isFavorite(String workKey) => _dao.exists(workKey);
}
