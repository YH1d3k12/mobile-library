/// Representação de um livro favorito conforme armazenado na tabela
/// `favorite_books` do SQLite.
class FavoriteBookEntity {
  final String workKey;
  final String title;
  final String author;
  final int? firstPublishYear;
  final String? publisher;
  final String? language;
  final int? coverId;
  final String? subject;
  final int savedAt;

  const FavoriteBookEntity({
    required this.workKey,
    required this.title,
    required this.author,
    this.firstPublishYear,
    this.publisher,
    this.language,
    this.coverId,
    this.subject,
    required this.savedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'work_key': workKey,
      'title': title,
      'author': author,
      'first_publish_year': firstPublishYear,
      'publisher': publisher,
      'language': language,
      'cover_id': coverId,
      'subject': subject,
      'saved_at': savedAt,
    };
  }

  factory FavoriteBookEntity.fromMap(Map<String, dynamic> map) {
    return FavoriteBookEntity(
      workKey: map['work_key'] as String,
      title: map['title'] as String,
      author: map['author'] as String,
      firstPublishYear: map['first_publish_year'] as int?,
      publisher: map['publisher'] as String?,
      language: map['language'] as String?,
      coverId: map['cover_id'] as int?,
      subject: map['subject'] as String?,
      savedAt: map['saved_at'] as int,
    );
  }
}
