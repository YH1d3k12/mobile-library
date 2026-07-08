import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../shared/widgets/main_app_bar.dart';
import '../../../favorites/domain/services/favorites_service.dart';
import '../../domain/models/book.dart';

/// Tela de detalhes de um livro selecionado, exibindo capa em
/// destaque e informações adicionais como editora, ano e idioma.
class BookDetailScreen extends StatelessWidget {
  final Book book;

  const BookDetailScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final favoritesService = ServiceLocator.instance.favoritesService;

    return Scaffold(
      appBar: MainAppBar(
        title: 'Detalhes',
        showBackButton: true,
        actions: [
          AnimatedBuilder(
            animation: favoritesService,
            builder: (context, _) {
              final isFavorite = favoritesService.isFavorite(book.workKey);
              return IconButton(
                tooltip: isFavorite
                    ? 'Remover dos favoritos'
                    : 'Adicionar aos favoritos',
                icon: Icon(
                  isFavorite ? Icons.star_rounded : Icons.star_border_rounded,
                  color: AppColors.gold,
                ),
                onPressed: () async {
                  await favoritesService.toggleFavorite(book);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          isFavorite
                              ? '"${book.title}" removido dos favoritos.'
                              : '"${book.title}" adicionado aos favoritos.',
                        ),
                      ),
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _CoverImage(url: book.coverUrlLarge),
              const SizedBox(height: 20),
              Text(
                book.title,
                textAlign: TextAlign.center,
                style: AppTypography.sectionTitle,
              ),
              const SizedBox(height: 6),
              Text(
                book.author,
                textAlign: TextAlign.center,
                style: AppTypography.cardSubtitle,
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 12),
              _DetailRow(
                icon: Icons.calendar_today_rounded,
                label: 'Ano de publicação',
                value: book.firstPublishYear?.toString() ?? 'Não informado',
              ),
              _DetailRow(
                icon: Icons.business_rounded,
                label: 'Editora',
                value: book.publisher ?? 'Não informada',
              ),
              _DetailRow(
                icon: Icons.language_rounded,
                label: 'Idioma',
                value: book.language ?? 'Não informado',
              ),
              _DetailRow(
                icon: Icons.category_rounded,
                label: 'Assunto',
                value: book.subject ?? 'Não informado',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CoverImage extends StatelessWidget {
  final String? url;
  const _CoverImage({required this.url});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      border: Border.all(color: AppColors.gold, width: 2),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: AppColors.royalPurple.withValues(alpha: 0.3),
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
      ],
    );

    if (url == null) {
      return Container(
        width: 160,
        height: 230,
        decoration: decoration.copyWith(color: AppColors.marbleDark),
        child: const Icon(
          Icons.menu_book_rounded,
          size: 56,
          color: AppColors.royalPurple,
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 160,
        height: 230,
        decoration: decoration,
        child: CachedNetworkImage(
          imageUrl: url!,
          fit: BoxFit.cover,
          placeholder: (context, _) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, _, __) => const Icon(
            Icons.menu_book_rounded,
            size: 56,
            color: AppColors.royalPurple,
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.royalPurple, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTypography.label),
                const SizedBox(height: 2),
                Text(value, style: AppTypography.body),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
