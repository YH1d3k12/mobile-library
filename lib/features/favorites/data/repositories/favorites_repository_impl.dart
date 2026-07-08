import '../../../books/domain/models/book.dart';
import '../../domain/repositories/favorites_repository.dart';
import '../datasources/favorites_local_datasource.dart';
import '../mappers/favorite_mapper.dart';

/// Implementação concreta de [FavoritesRepository] apoiada em SQLite local.
class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesLocalDataSource _localDataSource;

  FavoritesRepositoryImpl({FavoritesLocalDataSource? localDataSource})
      : _localDataSource = localDataSource ?? FavoritesLocalDataSource();

  @override
  Future<void> addFavorite(Book book) async {
    final entity = FavoriteMapper.toEntity(book);
    await _localDataSource.saveFavorite(entity);
  }

  @override
  Future<void> removeFavorite(String workKey) {
    return _localDataSource.removeFavorite(workKey);
  }

  @override
  Future<List<Book>> getFavorites() async {
    final entities = await _localDataSource.getAllFavorites();
    return FavoriteMapper.toBookList(entities);
  }

  @override
  Future<bool> isFavorite(String workKey) {
    return _localDataSource.isFavorite(workKey);
  }
}
