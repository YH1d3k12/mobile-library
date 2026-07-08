import '../../features/favorites/data/entities/favorite_book_entity.dart';
import '../app_database.dart';

/// Operações de acesso direto à tabela `favorite_books`.
class FavoriteBookDao {
  final AppDatabase _appDatabase;

  FavoriteBookDao({AppDatabase? appDatabase})
      : _appDatabase = appDatabase ?? AppDatabase.instance;

  Future<void> insert(FavoriteBookEntity entity) async {
    final db = await _appDatabase.database;
    await db.insert(AppDatabase.favoritesTable, entity.toMap());
  }

  Future<void> deleteByWorkKey(String workKey) async {
    final db = await _appDatabase.database;
    await db.delete(
      AppDatabase.favoritesTable,
      where: 'work_key = ?',
      whereArgs: [workKey],
    );
  }

  Future<List<FavoriteBookEntity>> getAll() async {
    final db = await _appDatabase.database;
    final rows = await db.query(
      AppDatabase.favoritesTable,
      orderBy: 'saved_at DESC',
    );
    return rows.map((row) => FavoriteBookEntity.fromMap(row)).toList();
  }

  Future<bool> exists(String workKey) async {
    final db = await _appDatabase.database;
    final rows = await db.query(
      AppDatabase.favoritesTable,
      where: 'work_key = ?',
      whereArgs: [workKey],
      limit: 1,
    );
    return rows.isNotEmpty;
  }
}
