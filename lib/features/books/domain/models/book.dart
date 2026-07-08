/// Modelo de negócio que representa um livro, já normalizado
/// e independente da estrutura bruta da API.
class Book {
  final String workKey;
  final String title;
  final String author;
  final int? firstPublishYear;
  final String? publisher;
  final String? language;
  final int? coverId;
  final String? subject;

  const Book({
    required this.workKey,
    required this.title,
    required this.author,
    this.firstPublishYear,
    this.publisher,
    this.language,
    this.coverId,
    this.subject,
  });

  /// URL da capa em tamanho médio, ou null se o livro não possuir capa.
  String? get coverUrlMedium => coverId != null
      ? 'https://covers.openlibrary.org/b/id/$coverId-M.jpg'
      : null;

  /// URL da capa em tamanho grande, usada na tela de detalhes.
  String? get coverUrlLarge => coverId != null
      ? 'https://covers.openlibrary.org/b/id/$coverId-L.jpg'
      : null;

  /// Resumo curto exibido na listagem de busca.
  String get shortSummary {
    final parts = <String>[
      if (firstPublishYear != null) 'Publicado em $firstPublishYear',
      if (subject != null) subject!,
    ];
    return parts.isEmpty ? 'Sem informações adicionais.' : parts.join(' • ');
  }

  Book copyWith({
    String? workKey,
    String? title,
    String? author,
    int? firstPublishYear,
    String? publisher,
    String? language,
    int? coverId,
    String? subject,
  }) {
    return Book(
      workKey: workKey ?? this.workKey,
      title: title ?? this.title,
      author: author ?? this.author,
      firstPublishYear: firstPublishYear ?? this.firstPublishYear,
      publisher: publisher ?? this.publisher,
      language: language ?? this.language,
      coverId: coverId ?? this.coverId,
      subject: subject ?? this.subject,
    );
  }
}
