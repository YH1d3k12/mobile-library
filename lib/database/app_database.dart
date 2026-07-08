import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// Configuração e ciclo de vida do banco SQLite local do aplicativo.
class AppDatabase {
  static const String databaseName = 'library_of_alexandria.db';
  static const int databaseVersion = 1;
  static const String favoritesTable = 'favorite_books';

  static Database? _database;

  AppDatabase._();
  static final AppDatabase instance = AppDatabase._();

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), databaseName);
    return openDatabase(
      path,
      version: databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $favoritesTable (
        work_key TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        author TEXT NOT NULL,
        first_publish_year INTEGER,
        publisher TEXT,
        language TEXT,
        cover_id INTEGER,
        subject TEXT,
        saved_at INTEGER NOT NULL
      )
    ''');
  }
}
