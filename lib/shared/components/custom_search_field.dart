import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

/// Campo de busca padronizado, usado na tela inicial para pesquisar
/// livros por título, autor ou palavras-chave.
class CustomSearchField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSubmitted;
  final VoidCallback onClear;
  final String hintText;

  const CustomSearchField({
    super.key,
    required this.controller,
    required this.onSubmitted,
    required this.onClear,
    this.hintText = 'Busque por título, autor ou palavra-chave',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: TextInputAction.search,
      onSubmitted: onSubmitted,
      style: const TextStyle(color: AppColors.ink),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(Icons.search_rounded, color: AppColors.royalPurple),
        suffixIcon: ValueListenableBuilder<TextEditingValue>(
          valueListenable: controller,
          builder: (context, value, _) {
            if (value.text.isEmpty) return const SizedBox.shrink();
            return IconButton(
              icon: const Icon(Icons.close_rounded, color: AppColors.inkSoft),
              tooltip: 'Limpar busca',
              onPressed: onClear,
            );
          },
        ),
      ),
    );
  }
}
