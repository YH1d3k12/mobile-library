import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

/// Indicador de carregamento centralizado, usado durante buscas
/// e demais operações assíncronas.
class LoadingOverlay extends StatelessWidget {
  final String message;

  const LoadingOverlay({super.key, this.message = 'Consultando o acervo...'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.gold),
            strokeWidth: 3,
          ),
          const SizedBox(height: 16),
          Text(message, style: AppTypography.bodyMuted),
        ],
      ),
    );
  }
}
