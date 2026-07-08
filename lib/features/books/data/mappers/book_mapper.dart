import '../../domain/models/book.dart';
import '../models/book_dto.dart';

/// Converte o DTO bruto da API para o modelo de negócio [Book].
class BookMapper {
  static Book fromDto(BookDto dto) {
    return Book(
      workKey: dto.key ?? '',
      title: (dto.title == null || dto.title!.trim().isEmpty)
          ? 'Título desconhecido'
          : dto.title!,
      author: (dto.authorName != null && dto.authorName!.isNotEmpty)
          ? dto.authorName!.first.toString()
          : 'Autor desconhecido',
      firstPublishYear: dto.firstPublishYear,
      publisher: (dto.publisher != null && dto.publisher!.isNotEmpty)
          ? dto.publisher!.first.toString()
          : null,
      language: (dto.language != null && dto.language!.isNotEmpty)
          ? dto.language!.first.toString().toUpperCase()
          : null,
      coverId: dto.coverI,
      subject: (dto.subject != null && dto.subject!.isNotEmpty)
          ? dto.subject!.first.toString()
          : null,
    );
  }

  static List<Book> fromDtoList(List<BookDto> dtos) {
    return dtos.map(fromDto).toList();
  }
}
