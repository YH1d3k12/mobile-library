import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

/// Exceção lançada quando a comunicação com a API falha.
class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => message;
}

/// Configuração base para requisições HTTP à Open Library API.
class ApiClient {
  static const String baseUrl = 'https://openlibrary.org';
  static const Duration timeout = Duration(seconds: 15);

  final http.Client _client;

  ApiClient({http.Client? client}) : _client = client ?? http.Client();

  /// Executa um GET para [path] com [queryParameters] opcionais.
  /// Retorna o corpo já decodificado como [Map<String, dynamic>].
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, String>? queryParameters,
  }) async {
    final uri = Uri.parse('$baseUrl$path').replace(
      queryParameters: queryParameters,
    );

    try {
      final response = await _client
          .get(uri, headers: const {'Accept': 'application/json'})
          .timeout(timeout);

      if (response.statusCode == 200) {
        final decoded = jsonDecode(utf8.decode(response.bodyBytes));
        if (decoded is Map<String, dynamic>) {
          return decoded;
        }
        throw ApiException('Resposta da API em formato inesperado.');
      } else if (response.statusCode == 404) {
        throw ApiException('Recurso não encontrado.');
      } else {
        throw ApiException(
          'Erro no servidor (código ${response.statusCode}). Tente novamente.',
        );
      }
    } on SocketException {
      throw ApiException('Sem conexão com a internet. Verifique sua rede.');
    } on HttpException {
      throw ApiException('Falha na comunicação com o servidor.');
    } on FormatException {
      throw ApiException('Não foi possível interpretar a resposta do servidor.');
    } catch (e) {
      if (e is ApiException) rethrow;
      throw ApiException('Ocorreu um erro inesperado: ${e.toString()}');
    }
  }

  void dispose() => _client.close();
}
