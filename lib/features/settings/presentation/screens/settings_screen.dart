import 'package:flutter/material.dart';
// Importe o gerenciador nativo que criamos no passo 1
import '../../../../core/theme/theme_manager.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Aparência',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            // Envolvemos o Switch com o ValueListenableBuilder para ele atualizar 
            // a interface (a bolinha do botão) assim que for clicado
            child: ValueListenableBuilder<ThemeMode>(
              valueListenable: ThemeManager.themeModeNotifier,
              builder: (context, themeMode, _) {
                final isDark = themeMode == ThemeMode.dark;
                
                return SwitchListTile(
                  title: const Text('Tema Escuro'),
                  secondary: const Icon(Icons.dark_mode),
                  value: isDark, 
                  onChanged: (value) {
                    // Chama a função que inverte o tema globalmente
                    ThemeManager.toggleTheme(value);
                  },
                  activeColor: Theme.of(context).colorScheme.secondary, // Deixa a cor do switch com o seu dourado
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}