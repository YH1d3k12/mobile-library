import '../../domain/models/book.dart';
import '../../domain/repositories/book_repository.dart';
import '../datasources/books_remote_datasource.dart';
import '../mappers/book_mapper.dart';

/// Implementação concreta de [BookRepository] usando a API pública
/// da Open Library como fonte de dados.
class BookRepositoryImpl implements BookRepository {
  final BooksRemoteDataSource _remoteDataSource;

  BookRepositoryImpl({BooksRemoteDataSource? remoteDataSource})
      : _remoteDataSource = remoteDataSource ?? BooksRemoteDataSource();

  @override
  Future<List<Book>> searchBooks(String query) async {
    final response = await _remoteDataSource.search(query);
    return BookMapper.fromDtoList(response.docs);
  }
}
