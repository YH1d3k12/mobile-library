import '../../../../core/network/api_client.dart';
import '../models/book_dto.dart';

/// Fonte de dados remota: consulta https://openlibrary.org/search.json
class BooksRemoteDataSource {
  final ApiClient _apiClient;

  BooksRemoteDataSource({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();

  /// Busca livros por título, autor ou palavras-chave.
  Future<BookSearchResponseDto> search(String query) async {
    if (query.trim().isEmpty) {
      throw ApiException('Digite algo para buscar.');
    }

    final json = await _apiClient.get(
      '/search.json',
      queryParameters: {
        'q': query.trim(),
        'fields':
            'key,title,author_name,first_publish_year,publisher,language,cover_i,subject',
        'limit': '30',
      },
    );

    return BookSearchResponseDto.fromJson(json);
  }
}
