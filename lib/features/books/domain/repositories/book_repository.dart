import '../models/book.dart';

/// Contrato de acesso a dados de livros, independente da origem.
abstract class BookRepository {
  Future<List<Book>> searchBooks(String query);
}
