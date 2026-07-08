import '../../features/books/data/datasources/books_remote_datasource.dart';
import '../../features/books/data/repositories/book_repository_impl.dart';
import '../../features/books/domain/repositories/book_repository.dart';
import '../../features/favorites/data/datasources/favorites_local_datasource.dart';
import '../../features/favorites/data/repositories/favorites_repository_impl.dart';
import '../../features/favorites/domain/repositories/favorites_repository.dart';
import '../../features/favorites/domain/services/favorites_service.dart';
import '../network/api_client.dart';

/// Localizador de serviços simples (DI manual), sem dependência de
/// pacotes externos como get_it. Instancia e expõe singletons das
/// dependências usadas pelas telas do aplicativo.
class ServiceLocator {
  ServiceLocator._();
  static final ServiceLocator instance = ServiceLocator._();

  late final ApiClient apiClient = ApiClient();

  late final BooksRemoteDataSource booksRemoteDataSource =
      BooksRemoteDataSource(apiClient: apiClient);

  late final BookRepository bookRepository =
      BookRepositoryImpl(remoteDataSource: booksRemoteDataSource);

  late final FavoritesLocalDataSource favoritesLocalDataSource =
      FavoritesLocalDataSource();

  late final FavoritesRepository favoritesRepository =
      FavoritesRepositoryImpl(localDataSource: favoritesLocalDataSource);

  late final FavoritesService favoritesService =
      FavoritesService(repository: favoritesRepository);
}
