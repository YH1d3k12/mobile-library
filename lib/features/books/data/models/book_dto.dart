/// Representação fiel de um item ("doc") retornado por
/// https://openlibrary.org/search.json
class BookDto {
  final String? key;
  final String? title;
  final List<dynamic>? authorName;
  final int? firstPublishYear;
  final List<dynamic>? publisher;
  final List<dynamic>? language;
  final int? coverI;
  final List<dynamic>? subject;

  BookDto({
    this.key,
    this.title,
    this.authorName,
    this.firstPublishYear,
    this.publisher,
    this.language,
    this.coverI,
    this.subject,
  });

  factory BookDto.fromJson(Map<String, dynamic> json) {
    return BookDto(
      key: json['key'] as String?,
      title: json['title'] as String?,
      authorName: json['author_name'] as List<dynamic>?,
      firstPublishYear: json['first_publish_year'] as int?,
      publisher: json['publisher'] as List<dynamic>?,
      language: json['language'] as List<dynamic>?,
      coverI: json['cover_i'] as int?,
      subject: json['subject'] as List<dynamic>?,
    );
  }
}

/// Representação da resposta completa de busca da API.
class BookSearchResponseDto {
  final int numFound;
  final List<BookDto> docs;

  BookSearchResponseDto({required this.numFound, required this.docs});

  factory BookSearchResponseDto.fromJson(Map<String, dynamic> json) {
    final docsJson = json['docs'] as List<dynamic>? ?? [];
    return BookSearchResponseDto(
      numFound: json['numFound'] as int? ?? 0,
      docs: docsJson
          .map((doc) => BookDto.fromJson(doc as Map<String, dynamic>))
          .toList(),
    );
  }
}
