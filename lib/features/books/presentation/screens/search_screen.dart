import 'package:flutter/material.dart';
import '../../../../shared/components/custom_drawer.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../routes/app_routes.dart';
import '../../../../shared/components/custom_search_field.dart';
import '../../../../shared/widgets/error_state_widget.dart';
import '../../../../shared/widgets/loading_overlay.dart';
import '../../../../shared/widgets/main_app_bar.dart';
import '../../domain/models/book.dart';
import '../../domain/repositories/book_repository.dart';
import '../widgets/book_list_item.dart';

enum _SearchStatus { idle, loading, success, empty, error }

/// Tela inicial: campo de busca de livros por título, autor ou
/// palavra-chave, com listagem de resultados.
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  final BookRepository _bookRepository = ServiceLocator.instance.bookRepository;

  _SearchStatus _status = _SearchStatus.idle;
  List<Book> _results = [];
  String _errorMessage = '';
  String _lastQuery = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _search(String query) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return;

    _lastQuery = trimmed;
    setState(() => _status = _SearchStatus.loading);

    try {
      final books = await _bookRepository.searchBooks(trimmed);
      if (!mounted) return;
      setState(() {
        _results = books;
        _status = books.isEmpty ? _SearchStatus.empty : _SearchStatus.success;
      });
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessage = e.message;
        _status = _SearchStatus.error;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Ocorreu um erro inesperado. Tente novamente.';
        _status = _SearchStatus.error;
      });
    }
  }

  void _clearSearch() {
    _controller.clear();
    setState(() {
      _results = [];
      _status = _SearchStatus.idle;
      _lastQuery = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- ATUALIZADO: Removemos o botão antigo das actions ---
      appBar: const MainAppBar(
        title: 'Biblioteca de Alexandria',
      ),
      
      // --- ATUALIZADO: Menu hambúrguer integrado perfeitamente ---
      drawer: const CustomDrawer(currentRoute: AppRoutes.search),
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomSearchField(
                controller: _controller,
                onSubmitted: _search,
                onClear: _clearSearch,
              ),
              const SizedBox(height: 16),
              Expanded(child: _buildBody()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_status) {
      case _SearchStatus.idle:
        return const _IdleState();
      case _SearchStatus.loading:
        return const LoadingOverlay();
      case _SearchStatus.empty:
        return ErrorStateWidget.noResults(onRetry: () => _search(_lastQuery));
      case _SearchStatus.error:
        return ErrorStateWidget(
          message: _errorMessage,
          onRetry: () => _search(_lastQuery),
        );
      case _SearchStatus.success:
        return ListView.builder(
          itemCount: _results.length,
          itemBuilder: (context, index) => BookListItem(book: _results[index]),
        );
    }
  }
}

class _IdleState extends StatelessWidget {
  const _IdleState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.account_balance_rounded,
              size: 64,
              color: AppColors.royalPurple,
            ),
            const SizedBox(height: 16),
            Text(
              'Explore o acervo da Biblioteca de Alexandria',
              textAlign: TextAlign.center,
              style: AppTypography.sectionTitle,
            ),
            const SizedBox(height: 8),
            const Text(
              'Digite um título, autor ou palavra-chave para começar sua busca.',
              textAlign: TextAlign.center,
              style: AppTypography.bodyMuted,
            ),
          ],
        ),
      ),
    );
  }
}