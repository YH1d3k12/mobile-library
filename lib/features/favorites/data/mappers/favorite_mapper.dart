import '../../../books/domain/models/book.dart';
import '../entities/favorite_book_entity.dart';

/// Converte entre o modelo de negócio [Book] e a entidade persistida
/// [FavoriteBookEntity].
class FavoriteMapper {
  static FavoriteBookEntity toEntity(Book book) {
    return FavoriteBookEntity(
      workKey: book.workKey,
      title: book.title,
      author: book.author,
      firstPublishYear: book.firstPublishYear,
      publisher: book.publisher,
      language: book.language,
      coverId: book.coverId,
      subject: book.subject,
      savedAt: DateTime.now().millisecondsSinceEpoch,
    );
  }

  static Book toBook(FavoriteBookEntity entity) {
    return Book(
      workKey: entity.workKey,
      title: entity.title,
      author: entity.author,
      firstPublishYear: entity.firstPublishYear,
      publisher: entity.publisher,
      language: entity.language,
      coverId: entity.coverId,
      subject: entity.subject,
    );
  }

  static List<Book> toBookList(List<FavoriteBookEntity> entities) {
    return entities.map(toBook).toList();
  }
}
